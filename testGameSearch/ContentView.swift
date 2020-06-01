//
//  ContentView.swift
//  testGameSearch
//
//  Created by Andy Walters on 5/31/20.
//  Copyright © 2020 Joseph Walters. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var gameVM: GameViewModel
    
    init() {
        self.gameVM = GameViewModel()
    }
    
    var body: some View {
        List {
             HStack{
                 TextField("Enter Game Name", text: self.$gameVM.name) {
                     self.gameVM.searchGames()
                 }
                 
                 Text(self.gameVM.name)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
