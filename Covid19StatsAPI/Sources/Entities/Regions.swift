//
//  Regions.swift
//  Covid19StatsAPI
//
//  Created by Daniel Koster on 5/14/21.
//

import Foundation

public struct Region: Codable {
    let iso: String
    let name: String
}

public struct RegionResponse: Codable {
    let data: [Region]
}
