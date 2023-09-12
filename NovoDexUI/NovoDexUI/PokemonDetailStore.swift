//
//  PokemonDetailStore.swift
//  NovoDexUI
//
//  Created by Sebastian Mejía on 11/09/23.
//

import Foundation

class PokemonDetailStore: ObservableObject {
    enum State {
        case loading
        case error(message: String)
        case loaded(model: PokemonModel, form: PokemonFormModel, generation: PokemonGenerationModel)
    }
    @Published var state: State = .loading
}

extension PokemonDetailStore: PokemonDetailPresenterDelegateProtocol {
    func renderLoading() {
        self.state = .loading
    }
    
    func render(errorMessage: String) {
        DispatchQueue.main.async {
            self.state = .error(message: errorMessage)
        }
    }
    
    func render(model: PokemonModel, form: PokemonFormModel, generation: PokemonGenerationModel) {
        DispatchQueue.main.async {
            self.state = .loaded(model: model, form: form, generation: generation)
        }
    }
}
