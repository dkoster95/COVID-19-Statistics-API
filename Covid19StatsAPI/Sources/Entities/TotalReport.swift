//
//  TotalReport.swift
//  Covid19StatsAPI
//
//  Created by Daniel Koster on 5/14/21.
//

import Foundation

public struct TotalReport: Codable {
    let date: String
    let last_update: String
    let confirmed: Int
    let confirmed_diff: Int
    let deaths: Int
    let deaths_diff: Int
    let recovered: Int
    let recovered_diff: Int
    let active: Int
    let active_diff: Int
    let fatality_rate: Int
}

public struct TotalReportResponse: Codable {
    let data: TotalReport
}
