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
    
    @ObservedObject var getGames = GameService()
    
    var body: some View {
        VStack {
            List(getGames.games) { game in
                VStack (alignment: .leading) {
                    Text(game.name)
                    if game.summary != nil {
                        Text(game.summary ?? "No Game Summary")}
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
