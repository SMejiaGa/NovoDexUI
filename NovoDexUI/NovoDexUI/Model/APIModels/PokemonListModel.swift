//
//  PokemonListModel.swift
//  NovoDexUI
//
//  Created by Sebastian Mejía on 11/09/23.
//

import Foundation

// MARK: - Welcome
struct PokemonListModel: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [ResultData]
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case results
    }
}

// MARK: - Result
struct ResultData: Codable, Identifiable, Hashable {
    let id = UUID() // Proporciona una propiedad identificadora única
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: ResultData, rhs: ResultData) -> Bool {
        return lhs.id == rhs.id
    }
}



