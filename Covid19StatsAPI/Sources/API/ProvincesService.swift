//
//  ProvincesAPIProtocol.swift
//  Covid19StatsAPI
//
//  Created by Daniel Koster on 5/17/21.
//

import Combine
import QuickHatch

public protocol ProvincesService {
    func get(iso: String) -> AnyPublisher<ProvincesResponse, Error>
}

public final class ProvincesAPI: ProvincesService {
    private let host: HostEnvironment
    private let requestFactory: NetworkRequestFactory
    
    public init(host: HostEnvironment, requestFactory: NetworkRequestFactory) {
        self.host = host
        self.requestFactory = requestFactory
    }
    public func get(iso: String) -> AnyPublisher<ProvincesResponse, Error> {
        guard let url = URL(string: host.baseURL + "/provinces"),
              let urlRequest = try? URLRequest.get(url: url,
                                                   params: ["iso": iso],
                                                   encoding: URLEncoding.default,
                                                   headers: host.headers) else {
            return Fail(error: RequestError.malformedRequest).eraseToAnyPublisher()
        }
        return requestFactory.response(urlRequest: urlRequest)
    }
}
