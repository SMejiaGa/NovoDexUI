//
//  PokemonDetailPresenterTests.swift
//  NovoDexUITests
//
//  Created by Sebastian Mejía on 12/09/23.
//

import XCTest
@testable import NovoDexUI

class PokemonDetailPresenterTests: XCTestCase {
    
    class MockService: PokemonServiceProtocol {
        func fetchPokemonList(completion: @escaping ((Result<NovoDexUI.PokemonListModel, Error>) -> Void)) {
            
        }
    
        var fetchPokemonModelCalled = false
        var fetchPokemonFormCalled = false
        var fetchPokemonGenerationCalled = false
        
        func fetchPokemonModel(id: Int, completion: @escaping (Result<PokemonModel, Error>) -> Void) {
            fetchPokemonModelCalled = true
        }
        
        func fetchPokemonForm(id: Int, completion: @escaping (Result<PokemonFormModel, Error>) -> Void) {
            fetchPokemonFormCalled = true
        }
        
        func fetchPokemonGeneration(id: Int, completion: @escaping (Result<PokemonGenerationModel, Error>) -> Void) {
            fetchPokemonGenerationCalled = true
        }
    }
    
    class MockDelegate: PokemonDetailPresenterDelegateProtocol {
        var renderModelCalled = false
        var renderErrorMessageCalled = false
        
        func render(model: PokemonModel, form: PokemonFormModel, generation: PokemonGenerationModel) {
            renderModelCalled = true
        }
        
        func render(errorMessage: String) {
            renderErrorMessageCalled = true
        }
    }
    
    var presenter: PokemonDetailPresenter!
    var mockService: MockService!
    var mockDelegate: MockDelegate!
    
    override func setUp() {
        super.setUp()
        mockService = MockService()
        mockDelegate = MockDelegate()
        presenter = PokemonDetailPresenter(service: mockService, delegate: mockDelegate)
    }
    
    func testFetchPokemonModel() {
        presenter.fetchPokemonModel(id: 1)
        XCTAssertTrue(mockService.fetchPokemonModelCalled)
    }
    
    func testFetchPokemonForm() {
        presenter.fetchPokemonForm(id: 1)
        XCTAssertTrue(mockService.fetchPokemonFormCalled)
    }
    
    func testFetchPokemonGeneration() {
        presenter.fetchPokemonGeneration(id: 1)
        XCTAssertTrue(mockService.fetchPokemonGenerationCalled)
    }
    
     
    
    func testRenderModel() {
        let jsonAny: [JSONAny] = []
        let mockModel = PokemonModel(abilities: [Ability(ability: Species(name: "", url: ""), isHidden: true, slot: 1)], baseExperience: 1, forms: [Species(name: "", url: "")], gameIndices: [GameIndex(gameIndex: 1, version: Species(name: "", url: ""))], height: 1, heldItems: jsonAny, id: 1, isDefault: true, locationAreaEncounters: "", moves: [Move(move: Species(name: "", url: ""), versionGroupDetails: [VersionGroupDetail(levelLearnedAt: 1, moveLearnMethod: Species(name: "", url: ""), versionGroup: Species(name: "", url: ""))])], name: "", order: 1, pastTypes: jsonAny, species: Species(name: "", url: ""), sprites: Sprites(backDefault: "", backFemale: nil, backShiny: "", backShinyFemale: nil, frontDefault: "", frontFemale: nil, frontShiny: "", frontShinyFemale: nil, other: nil, versions: nil, animated: nil), stats: [Stat(baseStat: 1, effort: 1, stat: Species(name: "", url: ""))], types: [TypeElement(slot: 1, type: Species(name: "", url: ""))], weight: 1)
        
        let mockForm = PokemonFormModel(formName: "", formNames: jsonAny, formOrder: 1, id: 1, isBattleOnly: true, isDefault: true, isMega: true, name: "", names: jsonAny, order: 1, pokemon: Pokemon(name: "", url: ""), sprites: Sprites(backDefault: "", backFemale: nil, backShiny: "", backShinyFemale: nil, frontDefault: "", frontFemale: nil, frontShiny: "", frontShinyFemale: nil, other: nil, versions: nil, animated: nil), types: [TypeElement(slot: 1, type: Species(name: "", url: ""))], versionGroup: Pokemon(name: "", url: ""))
    
        let mockGeneration = PokemonGenerationModel(baseHappiness: 1, captureRate: 1, color: Color(name: "", url: ""), eggGroups: [Color(name: "", url: "")], evolutionChain: EvolutionChain(url: ""), evolvesFromSpecies: nil, flavorTextEntries: [FlavorTextEntry(flavorText: "", language: Color(name: "", url: ""), version: Color(name: "", url: ""))], formDescriptions: jsonAny, formsSwitchable: true, genderRate: 1, genera: [Genus(genus: "", language: Color(name: "", url: ""))], generation: Color(name: "", url: ""), growthRate: Color(name: "", url: ""), habitat: Color(name: "", url: ""), hasGenderDifferences: true, hatchCounter: 1, id: 1, isBaby: true, isLegendary: true, isMythical: true, name: "", names: [Name(language: Color(name: "", url: ""), name: "")], order: 1, palParkEncounters: [PalParkEncounter(area: Color(name: "", url: ""), baseScore: 1, rate: 1)], pokedexNumbers: [PokedexNumber(entryNumber: 1, pokedex: Color(name: "", url: ""))], shape: Color(name: "", url: ""), varieties: [Variety(isDefault: true, pokemon: Color(name: "", url: ""))])
        
        presenter.fetchPokemonModel(id: 1)
        presenter.fetchPokemonForm(id: 1)
        presenter.fetchPokemonGeneration(id: 1)
        
        presenter.delegate?.render(model: mockModel, form: mockForm, generation: mockGeneration)
        
        XCTAssertTrue(mockDelegate.renderModelCalled)
    }
    
    func testRenderErrorMessage() {
        let errorMessage = "Error simulado"
        
        presenter.fetchPokemonModel(id: 1)
        presenter.delegate?.render(errorMessage: errorMessage)
        
        XCTAssertTrue(mockDelegate.renderErrorMessageCalled)
    }
}

