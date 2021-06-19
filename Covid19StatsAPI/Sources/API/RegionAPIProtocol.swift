//
//  RegionAPIProtocol.swift
//  Covid19StatsAPI
//
//  Created by Daniel Koster on 5/17/21.
//

import Combine
import QuickHatch

public protocol RegionsService {
    func get() -> AnyPublisher<RegionResponse, Error>
}

public final class RegionAPI: RegionsService {
    private let host: HostEnvironment
    private let requestFactory: NetworkRequestFactory
    
    public init(host: HostEnvironment, requestFactory: NetworkRequestFactory) {
        self.host = host
        self.requestFactory = requestFactory
    }
    
    public func get() -> AnyPublisher<RegionResponse, Error> {
        guard let url = URL(string: host.baseURL + "/regions"),
              let urlRequest = try? URLRequest.get(url: url,
                                                   encoding: URLEncoding.default,
                                                   headers: host.headers) else {
            return Fail(error: RequestError.malformedRequest).eraseToAnyPublisher()
        }
        return requestFactory.response(urlRequest: urlRequest)
    }
}
