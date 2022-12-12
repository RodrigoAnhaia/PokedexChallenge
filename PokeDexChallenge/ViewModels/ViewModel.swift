//
//  ViewModel.swift
//  PokeDexChallenge
//
//  Created by Rodrigo de Anhaia on 10/12/22.
//

import SwiftUI

final class ViewModel: ObservableObject {
    private let pokeManager = PokemonManager()

    @Published var pokeList = [Pokemon]()
    @Published var pokeDetails: DetailPokemons?
    @Published var searchText = ""

    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokeList : pokeList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }

    init() {
        self.pokeList = self.pokeManager.getPokemon()

    }

    func getPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = self.pokeList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }

    func getDetails(pokemon: Pokemon) {
        let id = getPokemonIndex(pokemon: pokemon)

        self.pokeDetails = DetailPokemons(id: 0, height: 0, weight: 0)

        pokeManager.getDetailedPokemons(id: id) { data in
            DispatchQueue.main.async {
                self.pokeDetails = data
                
            }
        }
    }

    func formatHeightWeight(value: Int) -> String {
        let dobleValue = Double(value)
        let string = String(format: "%.2f", dobleValue / 10)

        return string
    }
}
