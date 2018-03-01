//
//  Game.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 01/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation


class Game {
    var infiniteLoop = true
    
    
    func startGame () {
        print("===================")
        print("Vous pénétrez dans les catacombes au péril de votre vie !")
        print(" L'ambiance est lugubre. Un frisson vous parcoure le dos. Après cette quête vous découvrirez qui vous êtes réellement !  Vous avancez ")
        print("Soudain ! Vous vous vous retrouvez nez à nez avec une autre bande de mercenaires ! C'est l'affrontement ! La partie commence :")

        while infiniteLoop == true {
            
            
            print("@@@@@@@@@@@@ Start programm  @@@@@@@@@@@@@ ")
            Team.createTeams()
          
            
            print("@@@@@@@@@@@@@@ End program  @@@@@@@@@@@@@@@ ")
        }
        
    }
    
    func myInputString() -> String {
        guard let str = readLine() else { return "" }
        return str
    }
    
    
    
    func myInputInt() -> Int{
        guard let input = readLine() else {return 0}
        guard let inputToInt = Int(input) else {return 0}
        return inputToInt
    }
    
}
