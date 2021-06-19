//
//  ReportFilters.swift
//  Covid19StatsAPI
//
//  Created by Daniel Koster on 5/17/21.
//

import Foundation

public struct ReportFilters: Encodable {
    let query: String?
    let date: String?
    let regionName: String?
    let iso: String?
    let regionProvince: String?
    let cityName: String?
    
    public init(query: String? = nil,
                date: String? = nil,
                regionName: String? = nil,
                iso: String? = nil,
                regionProvince: String? = nil,
                cityName: String? = nil) {
        self.query = query
        self.date = date
        self.regionName = regionName
        self.iso = iso
        self.regionProvince = regionProvince
        self.cityName = cityName
    }
    
    enum CodingKeys: String, CodingKey {
        case query
        case date
        case iso
        case regionName = "region_name"
        case regionProvince = "region_province"
        case cityName = "city_name"
    }
}
