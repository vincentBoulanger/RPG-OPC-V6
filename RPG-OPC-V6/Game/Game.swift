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

            print("@@@@@@@ Start programm  @@@@@@@@@@ ")
            
            introStartGame()

        for i in 1...2 {
            print("===================================")
            print("Joueur \(i), entrez votre pseudo : ")
            
            let team = createTeam()
            
            tabTeams.append(team)
            let test = tabTeams[0]
          //  print("\(tabTeams[0].heroes[2])")
            print("\(test)")
            }
        
//        for i in 1...2 {
//
//            let team = createTeam()
//            tabTeams.append(team)
//        }
         //   let test = tabTeams[i].heroes[i].stuff.damage
            print("@@@@@@@@@@@@@@ End program  @@@@@@@@@@@@@@@ ")

    }
    
    
    
    func introStartGame() { // first display : Story
        print("===================")
        print("Vous pénétrez dans les catacombes au péril de votre vie !")
        print(" L'ambiance est lugubre. Un frisson vous parcoure le dos. Après cette quête vous découvrirez qui vous êtes réellement! Vous avancez dans l'obscurité ! ")
        print("Soudain à la lueur d'une torche ! Vous vous retrouvez nez à nez avec une autre bande de mercenaires ! C'est l'affrontement ! La partie commence : ")
    }
    
    
    func createTeam() -> Team { // composer une équipe
        let team = Team()
        team.createHeroes()
        return team
    }
    
    
    
    
}
