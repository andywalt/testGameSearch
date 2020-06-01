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
        
        let parameters = "fields name,summary; limit 5;"
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
                    print("No Data")
                }
            } catch {
                print("Error")
            }
        }.resume()
        
    }
    
    /*
    
    // I would like to be able to search for a game specifically by it's name. Does that mean I need it in my webservice when searching for games like below (getGames(name: String...)?
    func getGames(name: String, completion: @escaping (Game?) -> ()) {
        guard let url = URL(string: "https://api-v3.igdb.com/games") else { return }

        var request = URLRequest(url: url)
        request.setValue("c19caabe0607aee059f3cedb4bb8c6e1", forHTTPHeaderField: "user-key")
        request.httpBody = "fields id,name".data(using: .utf8, allowLossyConversion: false)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown Error").")
                return
            }
            
            // This is where I know it's not working. I also think I need to be mapping the data so it can be presented in a list.
            if let gameResponse = try? JSONDecoder().decode(Game.self, from: data) {
                completion(gameResponse)
            } else {print("Not Completing")}
            
        }.resume()
    }
 */
}
