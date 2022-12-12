//
//  PokeModel.swift
//  PokeDexChallenge
//
//  Created by Rodrigo de Anhaia on 10/12/22.
//

import Foundation

struct PokePage: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
}

struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let url: String

    static var samplePokemon = Pokemon(name: "bulbasaur",
                                       url: "https://pokeapi.co/api/v2/pokemon/1/")
}

struct DetailPokemons: Codable {
    let id: Int
    let height: Int
    let weight: Int
}
