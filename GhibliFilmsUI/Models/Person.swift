//
//  People.swift
//  GhibliFilmsUI
//
//  Created by EstherHuP on 12/3/26.
//

import Foundation

struct Person: Codable, Identifiable {
    let id: String
    let name: String
    let gender: String
    let age: String
    let films: [String]
    let species: String
    let url: String
}

import Playgrounds

#Playground {
    
    let url = URL(string: "https://ghibliapi.vercel.app/people/598f7048-74ff-41e0-92ef-87dc1ad980a9")!
    
    do {
        let (data, response) = try await URLSession.shared.data(from: url)
        let films = try JSONDecoder().decode(Person.self, from: data)
        print(films)
    } catch {
        print(error)
    }
}
