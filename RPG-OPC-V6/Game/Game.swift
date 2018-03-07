//
//  Game.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 07/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation

class Game {
    
 var tabTeams = [Team]()
    
    
    func startGame () {

            print("@@@@@@@@@@@@ Start programm  @@@@@@@@@@@@@ ")
            
            introStartGame()

        for i in 1...2 {
            print("====================")
            print("Joueur \(i), entrez votre pseudo : ")
            let player = createPlayer()
            print("Joueur \(i), vous vous appelerez désormais \(player)")
            let menuDisplay = Team()
            menuDisplay.describeTeam()
     
                
                
                let team = createTeam()
                tabTeams.append(team)
                let test = tabTeams[i].heroes[i].stuff.damage
            }
        
//        for i in 1...2 {
//
//            let team = createTeam()
//            tabTeams.append(team)
//        }
         //   let test = tabTeams[i].heroes[i].stuff.damage
            print("@@@@@@@@@@@@@@ End program  @@@@@@@@@@@@@@@ ")

    }
    
    
    
    func introStartGame() {
        print("===================")
        print("Vous pénétrez dans les catacombes au péril de votre vie !")
        print(" L'ambiance est lugubre. Un frisson vous parcoure le dos. Après cette quête vous découvrirez qui vous êtes réellement! Vous avancez dans l'obscurité ! ")
        print("Soudain à la lueur d'une torche ! Vous vous retrouvez nez à nez avec une autre bande de mercenaires ! C'est l'affrontement ! La partie commence : ")
    }
    
    func createPlayer() -> String { // Chose a player 
        let userPseudoPlayer = myInputString()
        return userPseudoPlayer
    }
    
    func createTeam() -> Team { // composer une équipe
        let team = Team()
        team.createHeroes()
        return team
    }
 
    // ##############################  Mes inputs ##################################
    
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
