//
//  Game.swift
//  testGameSearch
//
//  Created by Andy Walters on 5/31/20.
//  Copyright © 2020 Joseph Walters. All rights reserved.
//

import Foundation

struct Game: Codable, Identifiable, Hashable {
    
    let id: Int
    let name: String
    let summary: String?
    let platforms: [Platforms]
    
    struct Platforms: Codable, Identifiable, Hashable {
        let id: Int
        let name: String
    }

}
