//
//  APIError.swift
//  lottery
//
//  Created by your3i on 2022/09/18.
//

import Foundation

enum APIError: Error, LocalizedError {
    case unknown, apiError(reason: String), parserError(reason: String)

    var errorDescription: String? {
        switch self {
        case .unknown:
            return "Unknown error"
        case .apiError(let reason), .parserError(let reason):
            return reason
        }
    }
}
