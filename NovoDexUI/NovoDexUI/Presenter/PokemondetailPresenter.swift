//
//  Presenter.swift
//  NovoDexUI
//
//  Created by Sebastian Mejía on 9/09/23.
//
// https://medium.com/movile-tech/swiftui-and-architectures-mvp-c816ff7fbadd
import Foundation

protocol PokemonDetailPresenterProtocol: AnyObject {
    func fetchPokemonModel(id: Int)
    func fetchPokemonForm(id: Int)
    func fetchPokemonGeneration(id: Int)
}

protocol PokemonDetailPresenterDelegateProtocol: AnyObject {
    func render(model: PokemonModel, form: PokemonFormModel, generation: PokemonGenerationModel)
    func render(errorMessage: String)
}


class PokemonDetailPresenter: PokemonDetailPresenterProtocol {
    private var service: PokemonServiceProtocol
    private weak var delegate: (PokemonDetailPresenterDelegateProtocol)?
    private var pokemonModelData: PokemonModel?
    private var pokemonFormData: PokemonFormModel?
    private var pokemonGenerationData: PokemonGenerationModel?
    
    init(service: PokemonServiceProtocol, delegate: PokemonDetailPresenterDelegateProtocol) {
        self.service = service
        self.delegate = delegate
    }

    func fetchPokemonModel(id: Int) {
        service.fetchPokemonModel(id: id) { [weak self] result in
            switch result {
            case .failure(let error):
                self?.delegate?.render(errorMessage: error.localizedDescription)
            case .success(let pokemonSuccesData):
                self?.pokemonModelData = pokemonSuccesData
                self?.fetchPokemonForm(id: id)
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
                self?.fetchPokemonGeneration(id: id)
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
                guard let pokemonModelData = self?.pokemonModelData,
                      let pokemonFormData = self?.pokemonFormData,
                    let pokemonGenerationData = self?.pokemonGenerationData else { return }
                self?.delegate?.render(model: pokemonModelData, form: pokemonFormData, generation: pokemonGenerationData)
            }
        }
    }
}



