//
//  ContentView.swift
//  NovoDexUI
//
//  Created by Sebastian Mejía on 9/09/23.
//

import SwiftUI

struct ContentView: View {
    var presenter: PokemonPresenterProtocol
      @ObservedObject var store: PokemonStore

      init(store: PokemonStore, presenter: PokemonPresenterProtocol) {
        self.store = store
        self.presenter = presenter
      }

      var body: some View {
        NavigationView {
          switch store.state {
          case .loaded(let pokemons):
              if pokemons.count == 0 {
                  EmptyStateView()
              } else {
                  PokemonDisplayView(pokemonData: pokemons)
              }
          case .loading:
              LoadingView(presenter: presenter)
          case .error(let message):
              ErrorView(message: message)
          }
        }
        .navigationTitle("NovoDexUI")
        .onAppear {
            presenter.fetchPokemonList()
        }

      }
}
