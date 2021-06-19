//
//  ReportsServiceTests.swift
//  Covid19StatsAPI
//
//  Created by Daniel Koster on 5/17/21.
//

import XCTest
@testable import Covid19StatsAPI
import QuickHatch

class ReportsServiceTests: XCTestCase {
    let subject: ReportsAPI = ReportsAPI(requestFactory: MockRequestFactory(fakeRequest: FakeRequest()), host: Host())
    
    override func setUp() {
    }
    
    // test get reports
    // test API Error
    // test Parsing error
    // test success response
    // test get totals
    //
}
