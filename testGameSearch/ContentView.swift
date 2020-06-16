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
        VStack {
            TextField("Enter Game Name", text:
            self.$gameVM.gameName) {
                self.gameVM.searchGames()
            }
            
            Text(self.gameVM.gameName)
            
            /* This is how I was displaying the results of the API before trying to implement the VM again and add a search feature.
        
            List(gameVM.games) { game in
                VStack (alignment: .leading) {
                    Text(game.name)
                    if game.summary != nil {
                        Text(game.summary ?? "No Game Summary")}
                    ForEach(game.platforms) { platform in
                        Text(platform.name)
                    }
                }
            } */
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
