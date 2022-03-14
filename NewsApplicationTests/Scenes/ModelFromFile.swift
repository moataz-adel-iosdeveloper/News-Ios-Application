//
//  JSONFromFile.swift
//  NewsApplicationTests
//
//  Created by ModyMayaAser on 12/03/2022.
//

import Foundation
import UIKit

class ModelFromFile {
    func modelFromJSONFile<T: Codable>(file fileName : String , responseType : T.Type) -> T {
        guard let pathString = Bundle(for: type(of: self)).path(forResource: fileName, ofType: "json") else {
            fatalError("UnitTestData.json not found")
        }
        let data = try! Data(contentsOf: URL(fileURLWithPath: pathString))
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let model = try! decoder.decode(T.self, from: data)
        return model
    }

}
