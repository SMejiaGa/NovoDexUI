//
//  PokemonServiceProtocol.swift
//  NovoDexUI
//
//  Created by Sebastian Mejía on 9/09/23.
//

import Foundation

protocol PokemonServiceProtocol: AnyObject {
    func fetchPokemonList(completion: @escaping ((Result<PokemonListModel, Error>) -> Void))
    func fetchPokemonModel(id: Int, completion: @escaping ((Result<PokemonModel, Error>) -> Void))
    func fetchPokemonForm(id: Int, completion: @escaping ((Result<PokemonFormModel, Error>) -> Void))
    func fetchPokemonGeneration(id: Int, completion: @escaping ((Result<PokemonGenerationModel, Error>) -> Void))
}
