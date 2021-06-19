//
//  Covid19StatsAPITests.swift
//  Covid19StatsAPITests
//
//  Created by Daniel Koster on 5/14/21.
//

import XCTest
@testable import Covid19StatsAPI

class Covid19StatsAPITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let filter = ReportFilters(query: "query", regionName: "regionName", regionProvince: "province", cityName: "cityName")
        let dic = filter.dictionary
        XCTAssertNotNil(filter.dictionary!["region_name"])
    }


}
