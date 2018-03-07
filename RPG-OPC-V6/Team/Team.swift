//
//  Team.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 01/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation


class Team {
    
    var playerNumber = [Int]()
    var pseudoTab = [String]()
    
    
  
   

    
 
    let myHeroesGame = [Warrior(), Magician(), Dwarft(), Colossus()]
    
    var infiniteLoop = true
    func startGame () {
        while infiniteLoop == true {
            print("@@@@@@@@@@@@ Start programm  @@@@@@@@@@@@@ ")
            
            introStartGame()
            createTeam()
            
            print("@@@@@@@@@@@@@@ End program  @@@@@@@@@@@@@@@ ")
        }
    }

    func introStartGame() {
        print("===================")
        print("Vous pénétrez dans les catacombes au péril de votre vie !")
        print(" L'ambiance est lugubre. Un frisson vous parcoure le dos. Après cette quête vous découvrirez qui vous êtes réellement !  Vous avancez ")
        print("Soudain ! Vous vous retrouvez nez à nez avec une autre bande de mercenaires ! C'est l'affrontement ! La partie commence : ")
    }
    
    var teamsMember = [Hero]()
    var heroesTeam = [[Hero]]()
    
      let array = Array(repeating: [1,2,3], count: 3) // => [1, 2, 3, 1, 2, 3, 1, 2, 3]
    //var arr = Array(count: 3, repeatedValue: Array(count: 2, repeatedValue: 0))
    
    func createTeam() { // create player/pseudo 1 and 2
        
        for i in 1...2 {
            
            print("====================")
            print("Créez le joueur \(i) :")
            print("====================")
            print("Joueur \(i), entrez votre pseudo : ")
            let userPseudo = myInputString()
            
            pseudoTab.append(userPseudo)
            playerNumber.append(i)
            print("joueur \(i), vous vous appelerez désormais \(userPseudo)")

            print("")
            print("====================")
            print("\(userPseudo), créez l'équipe \(i) :")
            print("====================")
         
            heroesTeam.count
            
            for i in 1...3 {
                
                descriptionHeroDisplay()
                
                let userChoiceTeam = myInputInt()
                
                switch userChoiceTeam {
                    case 1:
                        print("\(userPseudo) Vous avez ajouté un guerrier)")
                       teamsMember[...].append(Warrior())
                    case 2:
                        print("\(userPseudo) Vous avez ajouté un magicien)")
                       teamsMember[...].append(Magician())
                    case 3:
                        print("\(userPseudo) Vous avez ajouté un nain)")
                       teamsMember[...].append(Dwarft())
                    case 4:
                        print("\(userPseudo) Vous avez ajouté un colosse)")
                        teamsMember[...].append(Colossus())
                    default:
                        print("Veuillez taper un chiffre entre 1 et 4")
                }
                        print("\(userPseudo), vous avez \(i) / 3 héros dans votre équipe.")
                }
            heroesTeam[...].append(teamsMember)
         }
        
        print("print heroes team Index 0   @@@@@@@@@@@@@@@@@@@ \(heroesTeam[0].count)")
        print("print heroes team index 1  @@@@@@@@@@@@@@@@@@@ \(heroesTeam[1].count)")
       //print("print heroes team index 2  @@@@@@@@@@@@@@@@@@@ \(heroesTeam[2].count)")
        print("print Heroes Team   @@@@@@@@@@@@@ \(heroesTeam)")
    }
 
    
        func descriptionHeroDisplay() {
            var heroNumber = 0
            print("================================================================================")
            for i in myHeroesGame {
                heroNumber += 1
                print("\(heroNumber) - Le \( i.descriptionClassHero) - Vie : \(i.lifePoints) - Attaque : \(i.attackPointsHero) - Soins : \(i.healHeroPoints)")
                    }
            print("Choisissez un chiffre entre 1 et 4.")
            print("================================================================================")
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
