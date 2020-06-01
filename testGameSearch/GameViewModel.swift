//
//  GameViewModel.swift
//  testGameSearch
//
//  Created by Andy Walters on 5/31/20.
//  Copyright © 2020 Joseph Walters. All rights reserved.
//

import Foundation
import Combine

class GameViewModel: ObservableObject {
    
    private var gameService: GameService
    
    // I'm getting the Missing argument for paramter 'from' in call. I tried hitting fix multiple times but nothing showed up.
    @Published var game = Game()
    
    init() {
        self.gameService = GameService()
        
    }
    
    var name: String = ""
    
    func searchGames() {
        if let game = self.name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            getGames(by: game)
        }
    }
    
    private func getGames(by name: String) {
        self.gameService.getGames(name: name) { game in
            if let game = game {
                DispatchQueue.main.async {
                    self.game = game
                }
            }
        }
    }
}
