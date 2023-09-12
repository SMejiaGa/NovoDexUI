//
//  PokemonRepository.swift
//  NovoDexUI
//
//  Created by Sebastian Mejía on 9/09/23.
//

import Foundation

struct PokemonRepository: Codable {
    let pokemonData: [PokemonModel]
    let form: [PokemonFormModel]
    let generation: [PokemonGenerationModel]
 
}
