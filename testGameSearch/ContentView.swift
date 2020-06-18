//
//  ContentView.swift
//  testGameSearch
//
//  Created by Andy Walters on 5/31/20.
//  Copyright © 2020 Joseph Walters. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var gameVM: GameViewModel
    
    init() {
        self.gameVM = GameViewModel()
    }
    
    var body: some View {
        ScrollView {
            
            TextField("Enter Game Name", text:
            self.$gameVM.gameName) {
                self.gameVM.searchGames()
            }
            
            ForEach(self.gameVM.games, id: \.self) { game in
                VStack(alignment: .leading) {
                    Text(game.name)
                        .bold()
                    Text(game.summary ?? "")
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
