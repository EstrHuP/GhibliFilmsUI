//
//  MockGhibliService.swift
//  GhibliFilmsUI
//
//  Created by EstherHuP on 13/3/26.
//

struct MockGhibliService: GhibliService {
    func fetchFilms() async throws -> [Film] {
         return []
    }
}
