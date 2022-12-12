//
//  PokemonManager.swift
//  PokeDexChallenge
//
//  Created by Rodrigo de Anhaia on 10/12/22.
//

import Foundation


class PokemonManager {
    func getPokemon() -> [Pokemon] {
        let data: PokePage = Bundle.main.decode(file: "pokemon.json")
        let pokemon: [Pokemon] = data.results

        return pokemon
    }

    func getDetailedPokemons(id: Int, _ completion: @escaping(DetailPokemons) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/",
                              model: DetailPokemons.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
}
