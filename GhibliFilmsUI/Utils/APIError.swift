//
//  APIError.swift
//  GhibliFilmsUI
//
//  Created by EstherHuP on 14/3/26.
//

import Foundation

enum APIError: LocalizedError {
        case invalidURL
        case invalidResponse
        case decoding(Error)
        case networkError(Error)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .invalidURL:               return "Invalid URL"
            case .invalidResponse:          return "Invalid response from server"
            case .decoding(let error):      return "Failed to decode: \(error.localizedDescription)"
            case .networkError(let error):  return "Network error: \(error.localizedDescription)"
            case .unknown:                  return "Unknown error"
            }
        }
    }
