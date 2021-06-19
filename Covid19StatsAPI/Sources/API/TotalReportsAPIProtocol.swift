//
//  TotalReportsAPIProtocol.swift
//  Covid19StatsAPI
//
//  Created by Daniel Koster on 5/14/21.
//

import QuickHatch
import Combine

public protocol ReportsAPIProtocol {
    func get() -> AnyPublisher<TotalReportResponse,Error>
}

public final class TotalReportsAPI: ReportsAPIProtocol {
    private let requestFactory: NetworkRequestFactory
    private let host: HostEnvironment
    
    public init(requestFactory: NetworkRequestFactory, host: HostEnvironment) {
        self.requestFactory = requestFactory
        self.host = host
    }
    
    public func get() -> AnyPublisher<TotalReportResponse, Error> {
        guard let url = URL(string: host.baseURL + "/reports/total/"),
              let urlRequest = try? URLRequest.get(url: url,
                                                   encoding: URLEncoding.default,
                                                   headers: host.headers) else {
            return Fail(error: RequestError.malformedRequest).eraseToAnyPublisher()
        }
        return requestFactory.response(urlRequest: urlRequest)
    }
}
