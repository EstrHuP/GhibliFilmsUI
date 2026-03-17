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
    
    enum State {
        case idle
        case loading
        case loaded([Any])
        case error(String)
    }
}
