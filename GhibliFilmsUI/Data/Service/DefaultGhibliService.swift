//
//  DefaultGhibliService.swift
//  GhibliFilmsUI
//
//  Created by EstherHuP on 13/3/26.
//

import Foundation

struct DefaultGhibliService: GhibliService {
    func fetchFilms() async throws -> [Film] {
        guard let url = URL(string: Constants.apiURL + Constants.apiFilmsEndpoint) else {
            throw APIState.APIError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode)
            else {
                throw APIState.APIError.invalidURL
            }
            return try JSONDecoder().decode([Film].self, from: data)
        } catch let error as DecodingError {
            throw APIState.APIError.decoding(error)
        } catch let error as URLError {
            throw APIState.APIError.networkError(error)
        } catch {
            throw error
        }
    }
}
