//
//  Presenter.swift
//  NovoDexUI
//
//  Created by Sebastian Mejía on 9/09/23.
//
// https://medium.com/movile-tech/swiftui-and-architectures-mvp-c816ff7fbadd
import Foundation

class PokemonPresenter: PokemonPresenterProtocol {
    private var service: PokemonServiceProtocol
    private weak var delegate: PokemonPresenterDelegateProtocol?
    private var pokemonViewData: [PokemonViewData] = []
    private var pokemonListData: PokemonListModel?
    private var pokemonModelData: PokemonModel?
    private var pokemonFormData: PokemonFormModel?
    private var pokemonGenerationData: PokemonGenerationModel?
    
    init(service: PokemonServiceProtocol, delegate: PokemonPresenterDelegateProtocol) {
        self.service = service
        self.delegate = delegate
    }
    
    func fetchPokemonList() {
        service.fetchPokemonList { [weak self] result in
            switch result {
            case .failure(let error):
                self?.delegate?.render(errorMessage: error.localizedDescription)
            case .success(let pokemonSuccesData):
                self?.pokemonListData = pokemonSuccesData
                self?.delegate?.render(Pokemons: (self?.pokemonListData)!)
            }
        }
    }
    
    func fetchPokemonModel(id: Int) {
        service.fetchPokemonModel(id: id) { [weak self] result in
            switch result {
            case .failure(let error):
                self?.delegate?.render(errorMessage: error.localizedDescription)
            case .success(let pokemonSuccesData):
                self?.pokemonModelData = pokemonSuccesData
            }
        }
    }
    
    
    func fetchPokemonForm(id: Int) {
        service.fetchPokemonForm(id: id) { [weak self] result in
            switch result {
            case .failure(let error):
                self?.delegate?.render(errorMessage: error.localizedDescription)
            case .success(let pokemonSuccesData):
                self?.pokemonFormData = pokemonSuccesData
            }
        }
    }
    
    func fetchPokemonGeneration(id: Int) {
        service.fetchPokemonGeneration(id: id) { [weak self] result in
            switch result {
            case .failure(let error):
                self?.delegate?.render(errorMessage: error.localizedDescription)
            case .success(let pokemonSuccesData):
                self?.pokemonGenerationData = pokemonSuccesData
            }
        }
    }
}



