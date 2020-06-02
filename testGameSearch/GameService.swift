//
//  GamesService.swift
//  testGameSearch
//
//  Created by Andy Walters on 5/31/20.
//  Copyright © 2020 Joseph Walters. All rights reserved.
//

import Foundation
import Combine

public class GameService: ObservableObject {
    
    @Published var games = [Game]()
    
    init(){
        getGames()
    }
    
    func getGames() {
        
        let parameters = "fields name, summary, platforms.name; where platforms = (48,6,49); limit 10;"
        let postData = parameters.data(using: .utf8)
        
        let url = URL(string: "https://api-v3.igdb.com/games/")!
        
        var request = URLRequest(url: url)
        request.addValue("c19caabe0607aee059f3cedb4bb8c6e1", forHTTPHeaderField: "user-key")
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = postData

        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode([Game].self, from: d)
                    DispatchQueue.main.async {
                        self.games = decodedLists
                    }
                } else {
                    print("No data in response: \(error?.localizedDescription ?? "Unknown Error").")
                }
            } catch {
                print("\(error)")
            }
        }.resume()
    }
}
