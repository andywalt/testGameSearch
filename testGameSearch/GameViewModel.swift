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
    @Published var games: [Game] = .init()
    
    init() {
        self.gameService = GameService()
        
    }
    
    @Published var gameName: String = ""
    
    func searchGames() {
            getGames(by: gameName)
    }
    
    private func getGames(by gameName: String) {
        self.gameService.getGames(gameName: gameName) { games in
                DispatchQueue.main.async {
                    self.games = games
                }
        }
    }
}

