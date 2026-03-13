//
//  FilmsListView.swift
//  GhibliFilmsUI
//
//  Created by EstherHuP on 13/3/26.
//

import Foundation
import SwiftUI

struct FilmListView: View {
    
    @State private var filmsViewModel = FilmsViewModel()
    
    var body: some View {
        NavigationStack {
            filmsState
        }
        .task {
            await filmsViewModel.fetch()
        }
    }
    
    @ViewBuilder
    private var filmsState: some View {
        switch filmsViewModel.state {
        case .idle:
            Text("No hay películas")
        case .loading:
            ProgressView {
                Text("Cargando...")
            }
        case .loaded(let films as [Film]):
            List(films) { film in
                Text(film.title)
            }
        case .error(let error):
            Text(error)
                .foregroundStyle(.red)
        default:
            EmptyView()
        }
    }
}

#Preview {
    FilmListView()
}
