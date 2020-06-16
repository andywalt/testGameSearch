//
//  GamesService.swift
//  testGameSearch
//
//  Created by Andy Walters on 5/31/20.
//  Copyright © 2020 Joseph Walters. All rights reserved.
//

import Foundation
import Combine

public class GameService {
    
    /*
    @Published var games = [Game]()
    
    init(){
        getGames()
    }
    */
    
    func getGames(gameName: String, completion: @escaping (Game?) -> ()) {
        
        let parameters = "search \"\(gameName)\"; fields name, summary, platforms.name; where platforms = (48,6,49); limit 10;"
        let postData = parameters.data(using: .utf8)
        
        guard let url = URL(string: "https://api-v3.igdb.com/games/") else {
            // Force unwrap would be fine if it's just a static string, but guard let is a better habit to get into.
            print("Invalid URL source https://api-v3.igdb.com/games/")
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue("c19caabe0607aee059f3cedb4bb8c6e1", forHTTPHeaderField: "user-key")
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = postData

        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                if let d = data {
                    let gameLists = try JSONDecoder().decode([Game].self, from: d)
                      DispatchQueue.main.async {
                        let game = gameLists.first
                        
                        completion(game)

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
