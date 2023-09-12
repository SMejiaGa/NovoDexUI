//
//  PokemonDetails.swift
//  NovoDexUI
//
//  Created by Sebastian Mejía on 11/09/23.
// cosas que deberiamos poner, screen reader mas colores, una fuente pokemonesca

import SwiftUI

struct PokemonDetails: View {
    
    var pokemonId: Int
    @ObservedObject var pokemonDetailStore: PokemonDetailStore
    var pokemonPresenter: PokemonDetailPresenterProtocol
    
    @State private var isExpanded: Bool = false
    
    init(pokemonId: Int, store: PokemonDetailStore) {
        self.pokemonId = pokemonId
        self.pokemonDetailStore = store
        self.pokemonPresenter = PokemonDetailPresenter(service: PokemonService(), delegate: store)
    }
    
    var body: some View {
        ZStack {
            switch pokemonDetailStore.state {
            case .error:
                ProgressView()
            case .loaded(let model, let form, let generation):
                ScrollView {
                    Text("\(model.name.uppercased())")
                        .font(.title)
                    TabView {
                        ForEach(form.sprites.getImageUrls(), id: \.self) { imageUrl in
                            AsyncImage(url: imageUrl) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFit()
                                case .failure:
                                    Image(systemName: "exclamationmark.icloud")
                                        .imageScale(.large)
                                        .foregroundColor(.red)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    .frame(minWidth: 200, idealWidth: 350, maxWidth: 400, minHeight: 200, idealHeight: 350, maxHeight: 400, alignment: .center)
                    
                    VStack {
                        Section {
                            Text("Types:")
                                .font(.largeTitle)
                            HStack {
                                ForEach(model.types, id: \.type.name) { type in
                                    Text(type.type.name)
                                        .font(.title3)
                                }
                            }
                        }
                        Spacer()
                        Divider()
                        Section {
                            Text("Abilities:")
                            ForEach(model.abilities, id: \.ability.name) { ability in
                                Text(ability.ability.name)
                            }
                        }
                        Divider()
                        Text("Stats:")
                        ForEach(model.stats, id: \.stat.name) { stat in
                            Text("\(stat.stat.name): \(stat.baseStat)")
                        }
                        Spacer()
                        Divider()
                        Section {
                            Text("Posible Moves:")
                            ForEach(model.moves, id: \.move.name) { move in
                                Text(move.move.name)
                            }
                            
                        }
                    }
                }
            case .loading:
                Text("Loading")
            }
        }
        .onAppear {
            pokemonPresenter.fetchPokemonModel(id: pokemonId)
            pokemonPresenter.fetchPokemonForm(id: pokemonId)
            pokemonPresenter.fetchPokemonGeneration(id: pokemonId)
        }
    }
}
