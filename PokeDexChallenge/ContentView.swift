//
//  ContentView.swift
//  PokeDexChallenge
//
//  Created by Rodrigo de Anhaia on 08/12/22.
//

import SwiftUI

struct ContentView: View {

    @StateObject var vm = ViewModel()
        
    var body: some View {
        VStack {
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
