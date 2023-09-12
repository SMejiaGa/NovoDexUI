//
//  PokemonFormModel.swift
//  NovoDexUI
//
//  Created by Sebastian Mejía on 10/09/23.
//

import Foundation


import Foundation

struct PokemonFormModel: Codable {
    let formName: String
    let formNames: [JSONAny]
    let formOrder, id: Int
    let isBattleOnly, isDefault, isMega: Bool
    let name: String
    let names: [JSONAny]
    let order: Int
    let pokemon: Pokemon
    let sprites: Sprites
    let types: [TypeElement]
    let versionGroup: Pokemon

    enum CodingKeys: String, CodingKey {
        case formName = "form_name"
        case formNames = "form_names"
        case formOrder = "form_order"
        case id
        case isBattleOnly = "is_battle_only"
        case isDefault = "is_default"
        case isMega = "is_mega"
        case name, names, order, pokemon, sprites, types
        case versionGroup = "version_group"
    }
}

// MARK: - Pokemon
struct Pokemon: Codable {
    let name: String
    let url: String
}


