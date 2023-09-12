//
//  PokemonDisplayView.swift
//  NovoDexUI
//
//  Created by Sebastian Mejía on 10/09/23.
//

import SwiftUI

struct PokemonDisplayView: View {
    
    var pokemonData: PokemonListModel
    var pokemonDetailStore = PokemonDetailStore()
    init(pokemonData: PokemonListModel) {
        self.pokemonData = pokemonData
    }
    
    private func getpokemonIdFromUrl(_ url: String) -> Int {
        let components = url.components(separatedBy: "/")
        guard components.count >= 2 else {
            return 1
        }
        if let penultimateComponent = components.dropLast().last,
           let id = Int(penultimateComponent) {
            return id
        } else {
            return 1
        }
    }
    
    var body: some View {
        NavigationView {
            List(pokemonData.results) { pokemon in
                ZStack {
                    NavigationLink(destination: PokemonDetails(pokemonId: getpokemonIdFromUrl(pokemon.url),store: pokemonDetailStore)) {
                        Text(pokemon.name)
                    }
                }
            }
        }
    }
}



