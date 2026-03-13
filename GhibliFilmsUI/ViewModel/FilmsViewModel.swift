//
//  FilmsViewModel.swift
//  GhibliFilmsUI
//
//  Created by EstherHuP on 13/3/26.
//

import Observation
import Foundation

@Observable
class FilmsViewModel {
    
    var films: [Film] = []
    var state: APIState.State = .idle
    var unknownError: APIState.APIError = .unknown
    
    private let service: GhibliService
    
    init(service: GhibliService = DefaultGhibliService()) {
        self.service = service
    }
    
    func fetch() async {
        
        guard case .idle = state else { return }
        state = .loading
        
        do {
            self.films = try await service.fetchFilms()
            self.state = .loaded(films)
        } catch let error as APIState.APIError {
            self.state = .error(error.errorDescription ?? unknownError.localizedDescription)
        } catch {
            self.state = .error(unknownError.localizedDescription)
        }
    }
}

