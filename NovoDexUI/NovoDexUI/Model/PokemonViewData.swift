//
//  PokemonDataModel.swift
//  NovoDexUI
//
//  Created by Sebastian Mejía on 8/09/23.
//

import Foundation

struct PokemonViewData: Identifiable {
    let id: UUID = UUID()
    let name: String
    let sprites: Sprites
    let types: [TypeElement]
}
