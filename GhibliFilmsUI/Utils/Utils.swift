//
//  Utils.swift
//  GhibliFilmsUI
//
//  Created by EstherHuP on 13/3/26.
//

import Foundation

struct Constants {
    static let apiURL = "https://ghibliapi.vercel.app"
    static let apiFilmsEndpoint = "/films"
}

struct APIState {
    
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
            case .decoding(let error):      return "Failed to decode: \(error)"
            case .networkError(let error):  return "Network error: \(error)"
            case .unknown:                  return "Unknown error"
            }
        }
    }
    
    enum State {
        case idle
        case loading
        case loaded([Any])
        case error(String)
    }
}
