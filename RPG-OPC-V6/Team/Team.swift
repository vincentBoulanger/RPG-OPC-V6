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
    
    var teams = [Hero]()
    var heroesTeam = [[Hero]]()
  
   
    /*
    enum myHeroesGame2:Int {
        case Warrior() = 1, Magician(), Dwarft(), Colossus()
 }
 */
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
           
    
            var teams = [Hero]()
            var heroesTeam = [[Hero]]()
            heroesTeam.append(teams)
for t in heroesTeam {
            
            for j in 1...3 {
                
                descriptionHeroDisplay()
                
                let userChoiceTeam = myInputInt()
                
                switch userChoiceTeam {
                    
                    case 1:
                        print("\(userPseudo) Vous avez ajouté un guerrier)")
                        teams.append(Warrior())
                    case 2:
                        print("\(userPseudo) Vous avez ajouté un magicien)")
                       teams.append(Magician())
                    case 3:
                        print("\(userPseudo) Vous avez ajouté un nain)")
                       teams.append(Dwarft())
                    case 4:
                        print("\(userPseudo) Vous avez ajouté un colosse)")
                        teams.append(Colossus())
                    default:
                        print("Veuillez taper un chiffre entre 1 et 4")
                }
                print("\(userPseudo), vous avez \(j) / 3 héros dans votre équipe.")
                }
     heroesTeam.append(teams)
            }
            
           


         //   print("print heroes team Index 0   @@@@@@@@@@@@@@@@@@@ \(heroesTeam[0].count)")
          //  print("print heroes team index 1  @@@@@@@@@@@@@@@@@@@ \(heroesTeam[1].count)")
print("print Heroes Team   @@@@@@@@@@@@@ \(heroesTeam)")
         }
        
        //print("print Heroes Team index 0   @@@@@@@@@@@@@ \(heroesTeam[0])")
        //  print("print Heroes Team index 1 @@@@@@@@@@@@@@\(heroesTeam[1])")
    }
    
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
