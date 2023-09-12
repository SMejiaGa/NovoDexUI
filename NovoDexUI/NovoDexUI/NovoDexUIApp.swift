//
//  NovoDexUIApp.swift
//  NovoDexUI
//
//  Created by Sebastian Mejía on 9/09/23.
//

import SwiftUI

@main
struct NovoDexUIApp: App {
    let store = PokemonStore()
    var body: some Scene {
        WindowGroup {
            ContentView(store: store, presenter: PokemonPresenter(service: PokemonService(), delegate: store))

        }
    }
}
