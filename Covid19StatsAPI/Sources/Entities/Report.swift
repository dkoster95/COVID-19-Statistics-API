//
//  Report.swift
//  Covid19StatsAPI
//
//  Created by Daniel Koster on 5/14/21.
//

import Foundation

public struct Report: Codable {
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
    let region: ReportRegion
}

public struct ReportResponse: Codable {
    let data: [ReportResponse]
}

public struct ReportRegion: Codable {
    let iso: String
    let name: String
    let province: String
    let lat: Double
    let long: Double
    let cities: [String]
}
