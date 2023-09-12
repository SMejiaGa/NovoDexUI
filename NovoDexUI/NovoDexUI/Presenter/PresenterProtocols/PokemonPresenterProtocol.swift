//
//  PokemonPresenterProtocol.swift
//  NovoDexUI
//
//  Created by Sebastian Mejía on 9/09/23.
//

import Foundation

protocol PokemonPresenterProtocol: AnyObject {
    func fetchPokemonList()
    func fetchPokemonModel(id: Int)
    func fetchPokemonForm(id: Int)
    func fetchPokemonGeneration(id: Int) 
}
