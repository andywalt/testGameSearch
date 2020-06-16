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
    
    @Published var game = Game()
    
    //getting a Missing argument for paramter 'from' in call error here
    
    
    init() {
        self.gameService = GameService()
        
    }
    
    var gameName: String = ""
    
    func searchGames() {
        if let game = self.game.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            getGames(by: game)
        }
    }
    
    private func getGames(by game: String) {
        self.gameService.getGames(game: game) { game in
            if let game = game {
                DispatchQueue.main.async {
                    self.game = game
                }
            }
        }
    }
}

