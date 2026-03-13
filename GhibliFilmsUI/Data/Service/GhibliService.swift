//
//  GhibliService.swift
//  GhibliFilmsUI
//
//  Created by EstherHuP on 13/3/26.
//

protocol GhibliService {
    func fetchFilms() async throws -> [Film]
}
