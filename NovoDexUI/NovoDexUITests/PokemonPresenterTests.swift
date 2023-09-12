//
//  PokemonPresenterTests.swift
//  NovoDexUITests
//
//  Created by Sebastian Mejía on 12/09/23.
//

import XCTest
@testable import NovoDexUI

class PokemonPresenterTests: XCTestCase {
    
    class MockService: PokemonServiceProtocol {
        var fetchPokemonListCalled = false
        var fetchPokemonModelCalled = false
        var fetchPokemonFormCalled = false
        var fetchPokemonGenerationCalled = false
        
        func fetchPokemonList(completion: @escaping (Result<PokemonListModel, Error>) -> Void) {
            fetchPokemonListCalled = true
        }
        
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
    
    class MockDelegate: PokemonPresenterDelegateProtocol {
        var renderLoadingCalled = false
        var renderErrorMessageCalled = false
        var renderPokemonsCalled = false
        
        func renderLoading() {
            renderLoadingCalled = true
        }
        
        func render(errorMessage: String) {
            renderErrorMessageCalled = true
        }
        
        func render(Pokemons: PokemonListModel) {
            renderPokemonsCalled = true
        }
    }
    
    var presenter: PokemonPresenter!
    var mockService: MockService!
    var mockDelegate: MockDelegate!
    
    override func setUp() {
        super.setUp()
        mockService = MockService()
        mockDelegate = MockDelegate()
        presenter = PokemonPresenter(service: mockService, delegate: mockDelegate)
    }
    
    func testFetchPokemonList() {
        presenter.fetchPokemonList()
        XCTAssertTrue(mockService.fetchPokemonListCalled)
        XCTAssertTrue(mockDelegate.renderPokemonsCalled)
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
}
