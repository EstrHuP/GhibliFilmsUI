//
//  DefaultGhibliService.swift
//  GhibliFilmsUI
//
//  Created by EstherHuP on 13/3/26.
//

import Foundation

struct DefaultGhibliService: GhibliService {
    
    func fetchData<T: Decodable>(from URLString: String, type: T.Type) async throws -> T {
        guard let url = URL(string: URLString) else {
            throw APIState.APIError.invalidURL
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode)
            else {
                throw APIState.APIError.invalidURL
            }
            return try JSONDecoder().decode(type, from: data)
        } catch let error as DecodingError {
            throw APIState.APIError.decoding(error)
        } catch let error as URLError {
            throw APIState.APIError.networkError(error)
        } catch {
            throw error
        }
    }
    
    func fetchFilms() async throws -> [Film] {
        let urlString = Constants.apiURL + Constants.apiFilmsEndpoint
        return try await fetchData(from: urlString, type: [Film].self)
    }
    
    func fetchPerson(from url: String) async throws -> Person {
        return try await fetchData(from: url, type: Person.self)
    }
}
