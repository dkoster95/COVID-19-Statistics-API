//
//  TotalReportsAPIProtocol.swift
//  Covid19StatsAPI
//
//  Created by Daniel Koster on 5/14/21.
//

import QuickHatch
import Combine

public protocol ReportsService {
    func getTotals(date: String?) -> AnyPublisher<TotalReportResponse,Error>
    func get(filters: ReportFilters) -> AnyPublisher<ReportResponse, Error>
}

public final class ReportsAPI: ReportsService {
    private let requestFactory: NetworkRequestFactory
    private let host: HostEnvironment
    
    public init(requestFactory: NetworkRequestFactory, host: HostEnvironment) {
        self.requestFactory = requestFactory
        self.host = host
    }
    
    public func getTotals(date: String?) -> AnyPublisher<TotalReportResponse, Error> {
        guard let url = URL(string: host.baseURL + "/reports/total/"),
              let params = date != nil ? ["date": date!] : [:],
              let urlRequest = try? URLRequest.get(url: url,
                                                   params: params,
                                                   encoding: URLEncoding.default,
                                                   headers: host.headers) else {
            return Fail(error: RequestError.malformedRequest).eraseToAnyPublisher()
        }
        return requestFactory.response(urlRequest: urlRequest)
    }
    
    public func get(filters: ReportFilters) -> AnyPublisher<ReportResponse, Error> {
        guard let url = URL(string: host.baseURL + "/reports"),
              let params = filters.dictionary,
              let urlRequest = try? URLRequest.get(url: url,
                                                   params: params,
                                                   encoding: URLEncoding.default,
                                                   headers: host.headers) else {
            return Fail(error: RequestError.malformedRequest).eraseToAnyPublisher()
        }
        return requestFactory.response(urlRequest: urlRequest)
    }
}

extension Encodable {
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
}
