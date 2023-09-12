//
//  Constants.swift
//  NovoDexUI
//
//  Created by Sebastian Mejía on 10/09/23.
//

import Foundation

struct Constants {
    static let APP_GENERATION: Generations = .first
    static let DEFAULT_ENDPOINT = "https://pokeapi.co/api/v2"
    static let LIST_ENDPOINT_COMPLEMENT_OFFSET = "/pokemon?offset="
    static let LIST_ENDPOINT_COMPLEMENT_LIMIT = "&limit="
    static let MODEL_ENDPOINT_COMPLEMENT = "/pokemon/"
    static let FORM_ENDPOINT_COMPLEMENT = "/pokemon-form/"
    static let GENERATION_ENDPOINT_COMPLEMENT = "/pokemon-species/"
    
    static let APP_NAME = "NovoDexUI"
    static let DEVELOPER = "Sebastian Mejia"
    static let SEARCH_TEXT = "Search for your favorite Pokemon!"
}
