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
    var heroesTeam = [Hero]()
    var myHeroesGame = [Warrior(), Magician(), Dwarft(), Colossus()]
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

            for i in 1...3 {
                
                descriptionHeroDisplay()
                let userChoiceTeam = myInputInt()
                switch userChoiceTeam {
                    case 1:
                        heroesTeam.append(Warrior())
                        print("\(userPseudo) Vous avez ajouté un guerrier)")
                    case 2:
                        heroesTeam.append(Magician())
                        print("\(userPseudo) Vous avez ajouté un magicien)")
                    case 3:
                        heroesTeam.append(Dwarft())
                        print("\(userPseudo) Vous avez ajouté un nain)")
                    case 4:
                        heroesTeam.append(Colossus())
                        print("\(userPseudo) Vous avez ajouté un colosse)")
                    default:
                        print("default")
                }
                print("\(userPseudo), vous avez \(i) / 3 héros dans votre équipe.")
            }
            print("\(heroesTeam.count / i)")
        }
            
             print("\(heroesTeam)")
    }
        /*
             let tab = ["A1", "A2", "A3", "B1", "B2", "C1", "C2", "C3", "C4"]
             let tab_A = tab.filter({ Array($0)[0] == "A" })
             let tab_B = tab.filter({ Array($0)[0] == "B" })
             let tab_C = tab.filter({ Array($0)[0] == "C" })
             print (tab_A)
             print (tab_B)
             print (tab_C)
            */

    
    
        func descriptionHeroDisplay() {
            var heroNumber = 0
            print("================================================================================")
            for i in myHeroesGame {
                heroNumber += 1
                print("\(heroNumber) - Le \( i.descriptionClassHero) - Vie : \(i.lifePoints) - Attaque : \(i.attackPointsHero) - Soins : \(i.healHeroPoints)")
                    }
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


