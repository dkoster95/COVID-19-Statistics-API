//
//  Provinces.swift
//  Covid19StatsAPI
//
//  Created by Daniel Koster on 5/14/21.
//

import Foundation

public struct Province: Codable {
    let iso: String
    let name: String
    let province: String
    let lat: Double
    let long: Double
}

public struct ProvincesResponse: Codable {
    let data: [Province]
}
