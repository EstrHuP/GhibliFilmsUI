//
//  MockGhibliService.swift
//  GhibliFilmsUI
//
//  Created by EstherHuP on 13/3/26.
//

struct MockGhibliService: GhibliService {
    func fetchPerson(from url: String) async throws -> Person {
        <#code#>
    }
    
    func fetchFilms() async throws -> [Film] {
         return []
    }
}
