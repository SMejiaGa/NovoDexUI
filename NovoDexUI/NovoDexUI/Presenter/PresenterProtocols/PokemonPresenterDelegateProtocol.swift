//
//  PokemonPresenterDelegateProtocol.swift
//  NovoDexUI
//
//  Created by Sebastian Mejía on 9/09/23.
//

import Foundation

protocol PokemonPresenterDelegateProtocol: AnyObject {
    func render(errorMessage: String)
    func renderLoading()
    func render(Pokemons: PokemonListModel)
}
