//
//  LoadingView.swift
//  NovoDexUI
//
//  Created by Sebastian Mejía on 10/09/23.
//

import SwiftUI

struct LoadingView: View {
    var presenter: PokemonPresenterProtocol
    
    init(presenter: PokemonPresenterProtocol) {
        self.presenter = presenter
    }
    
    var body: some View {
        Button {
            presenter.fetchPokemonList()
        } label: {
            Text("Reload data")
        }
    }
}

