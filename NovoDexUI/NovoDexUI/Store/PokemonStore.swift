//
//  PokemonStore.swift
//  NovoDexUI
//
//  Created by Sebastian Mejía on 10/09/23.
//

import Foundation

class PokemonStore: ObservableObject {
  enum State {
    case loading
    case error(message: String)
      case loaded(data: PokemonListModel)
  }
    @Published var state: State = .loading
}

extension PokemonStore: PokemonPresenterDelegateProtocol {
    func renderLoading() {
        self.state = .loading
    }
    
  func render(errorMessage: String) {
    self.state = .error(message: errorMessage)
  }

    func render(Pokemons: PokemonListModel) {
      self.state = .loaded(data: Pokemons)
  }
}
