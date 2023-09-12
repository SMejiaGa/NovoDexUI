//
//  PokemonService.swift
//  NovoDexUI
//
//  Created by Sebastian Mejía on 10/09/23.
//

import Foundation

class PokemonService: PokemonServiceProtocol {

    
    func fetchPokemonList(completion: @escaping ((Result<PokemonListModel, Error>) -> Void)) {
        guard let url = URL(string: "\(Constants.DEFAULT_ENDPOINT)/pokemon?offset=0&limit=\(151)") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(error!))
                return
            }
            do {
                let pokeRepo = try JSONDecoder().decode(PokemonListModel.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(pokeRepo))
                }
            }
            catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    func fetchPokemonModel(id: Int,completion: @escaping ((Result<PokemonModel, Error>) -> Void)) {
        guard let url = URL(string: "\(Constants.DEFAULT_ENDPOINT)/pokemon/\(id)") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(error!))
                return
            }
            do {
                let pokeRepo = try JSONDecoder().decode(PokemonModel.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(pokeRepo))
                }
            }
            catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    
    func fetchPokemonForm(id: Int, completion: @escaping ((Result<PokemonFormModel, Error>) -> Void)) {
        guard let url = URL(string: "\(Constants.DEFAULT_ENDPOINT)/pokemon-form/\(id)") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(error!))
                return
            }
            do {
                let pokeRepo = try JSONDecoder().decode(PokemonFormModel.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(pokeRepo))
                }
            }
            catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    
    func fetchPokemonGeneration(id: Int, completion: @escaping ((Result<PokemonGenerationModel, Error>) -> Void)) {
        guard let url = URL(string: "\(Constants.DEFAULT_ENDPOINT)/pokemon-species/\(id)")  else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(error!))
                return
            }
            do {
                let pokeRepo = try JSONDecoder().decode(PokemonGenerationModel.self, from: data)
                completion(.success(pokeRepo))
            }
            catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

