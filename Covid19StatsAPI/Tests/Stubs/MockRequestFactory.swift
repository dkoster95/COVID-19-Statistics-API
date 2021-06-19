//
//  MockRequestFactory.swift
//  Covid19StatsAPI
//
//  Created by Daniel Koster on 6/14/21.
//
import QuickHatch
import Combine

class MockRequestFactory: NetworkRequestFactory {
    let fakeRequest: FakeRequest
    
    init(fakeRequest: FakeRequest) {
        self.fakeRequest = fakeRequest
    }
    
    var data: Data?
    var urlResponse = HTTPURLResponse(url: URL(fileURLWithPath: ""),
                                      statusCode: 200,
                                      httpVersion: nil,
                                      headerFields: nil)!
    var error: Error?
    func data(request: URLRequest, dispatchQueue: DispatchQueue, completionHandler completion: @escaping DataCompletionHandler) -> Request {
        if let data = data {
            completion(.success(Response(data: data,
                                         httpResponse: urlResponse)))
        } else if let error = error {
            completion(.failure(error))
        }
        return fakeRequest
    }
    
//    func data(request: URLRequest, dispatchQueue: DispatchQueue) -> AnyPublisher<Data, Error> {
//
//    }
}

class FakeRequest: NSObject, Request {
    var requestResumed = false
    func resume() {
        requestResumed = true
    }
    
    var requestSuspended = false
    func suspend() {
        requestSuspended = true
    }
    
    var requestCancelled = false
    func cancel() {
        requestCancelled = true
    }
}
