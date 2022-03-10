//
//  ErrorResponce.swift
//  NewsApplication
//
//  Created by ModyMayaAser on 08/03/2022.
//

import Foundation

// MARK: - ErrorResponce
struct ErrorResponse: Codable {
    let fault: Fault
}

// MARK: - Fault
struct Fault: Codable {
    let faultstring: String
    let detail: Detail
}

// MARK: - Detail
struct Detail: Codable {
    let errorcode: String
}
