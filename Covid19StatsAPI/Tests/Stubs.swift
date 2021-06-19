//
//  Stubs.swift
//  Covid19StatsAPI
//
//  Created by Daniel Koster on 5/14/21.
//

import Foundation
import Covid19StatsAPI

class Stubs {
    
    private static let reader = StubReader(bundle: Bundle.init(for: Stubs.self))
    static var totalReports: TotalReportResponse {
        return try! reader.read(fileName: "totalreports", fileType: "json")
    }
    
    static var provinces: ProvincesResponse {
        return try! reader.read(fileName: "provinces", fileType: "json")
    }
    
    static var regions: RegionResponse {
        return try! reader.read(fileName: "regions", fileType: "json")
    }
    
    static var reports: ReportResponse {
        return try! reader.read(fileName: "reports", fileType: "json")
    }
}

enum StubReaderError: Error {
    case filePathError
    case fileError
    case contentError
}
protocol StubReadable {
    func read<Content: Codable>(fileName: String, fileType: String) throws -> Content
}

class StubReader: StubReadable {
    private let bundle: Bundle
    private let jsonDecoder: JSONDecoder
    
    init(bundle: Bundle, jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.bundle = bundle
        self.jsonDecoder = jsonDecoder
    }
    
    func read<Content>(fileName: String, fileType: String) throws -> Content where Content : Decodable, Content : Encodable {
        guard let filePath = bundle.path(forResource: fileName, ofType: fileType) else {
            throw StubReaderError.filePathError
        }
        guard let url = URL(string: filePath),
              let contentOfFile = try? Data(contentsOf: url) else {
            throw StubReaderError.fileError
        }
        guard let content = try? jsonDecoder.decode(Content.self, from: contentOfFile) else {
            throw StubReaderError.contentError
        }
        return content
    }
    
    
}
