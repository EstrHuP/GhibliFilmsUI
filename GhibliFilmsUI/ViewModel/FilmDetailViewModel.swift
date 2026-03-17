//
//  FilmDetailViewModel.swift
//  GhibliFilmsUI
//
//  Created by EstherHuP on 14/3/26.
//

class FilmDetailViewModel {
    
    var people: [Person] = []
    let service: GhibliService
    
    init(service: GhibliService = DefaultGhibliService()) {
        self.service = service
    }
    
    func fetchPeople(for film: Film) async throws {
        for personInfoURL in film.people {
            try await service.fetchPerson(from: personInfoURL)
        }
    }
}
