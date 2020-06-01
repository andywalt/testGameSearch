//
//  Game.swift
//  testGameSearch
//
//  Created by Andy Walters on 5/31/20.
//  Copyright © 2020 Joseph Walters. All rights reserved.
//

import Foundation

struct Game: Codable, Identifiable {
    let id: Int
    let name: String
    let summary: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case summary = "summary"
    }
}
