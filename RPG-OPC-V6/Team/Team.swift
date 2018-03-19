//
//  Team.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 01/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation


class Team {
    
    var heroes = [Hero]() // create empty tab hero

    
    func describeHeroMenu() { // selection hero menu display

                print("==============================================================")
                print("1 - Guerrier - Vie: 100 - Attaque: 10")
                print("2 - Colosse  - Vie: 150 - Attaque: 5 ")
                print("3 - Nain     - Vie: 130 - Attaque: 30 ")
                print("4 - Magicien - Vie: 80  - Soins  : 20")
                print("==============================================================")
                print("Choisissez un héros en tapant un chiffre entre 1 et 4 ========")
    }
    
    func createHeroes() { // create player/pseudo 1 and 2, cette fonction remplit le tab ligne 14 avec 3 PERSO
        
                let userPseudoPlayer = Input.myInputString()
                print("Vous vous appelerez désormais \(userPseudoPlayer)")
                //describeHeroMenu()
        
        
        for _ in 0..<3 {
            
                var userChoiceTeam = 0
                 // call the function describe Hero Menu
            
            repeat {
                describeHeroMenu()
                userChoiceTeam = Input.myInputInt() // input selection hero's player
                
           } while userChoiceTeam != 1 && userChoiceTeam != 2 && userChoiceTeam != 3 && userChoiceTeam != 4
            
                    switch userChoiceTeam { // the player's choices are compared with the prpposition's game
                        
                        case 1:
                            print("\(userPseudoPlayer) Vous avez ajouté un guerrier.")
                            heroes.append(Warrior())
                  
                        case 2:
                            print("\(userPseudoPlayer) Vous avez ajouté un colosse.")
                            heroes.append(Colossus())
              
                        case 3:
                            print("\(userPseudoPlayer) Vous avez ajouté un nain.")
                            heroes.append(Dwarft())
          
                        case 4:
                            print("\(userPseudoPlayer) Vous avez ajouté un magicien.")
                            heroes.append(Magician())
          
                        default:
                           return
                        }
                    }
                    namingHero() // call the function to rename the heroes
        
            }
    
    
    func namingHero() { // function to rename the heroes by the players
        for i in heroes {
                print("Choisissez un pseudo pour votre : \(i.descriptionClassHero)")
                let pseudoHero = Input.myInputString()
                i.nameHero = pseudoHero
                print("Votre \(i.descriptionClassHero) s'appelle \(i.nameHero)" )
        }
    }
    
    func statsTeams() {
        for i in 0..<heroes.count {
            let hero = heroes[i]
            if hero is Warrior || hero is Dwarft || hero is Colossus {
            print("\(i+1) - \(hero.nameHero), le \(hero.descriptionClassHero) possède \(hero.lifePoints) de vie et une attaque de \(hero.stuff.damage) points.")
            } else if hero is Magician {
                print("\(i+1) - \(hero.nameHero), le \(hero.descriptionClassHero) possède \(hero.lifePoints) de vie et peut soigner \(hero.stuff.damage) points. de vie.")
            } 
        }
        print("==================================================================")
    }




    // #############################################################################
//       func teamDescription() { // faire un print
//            var heroNumber = 0
//            print("================================================================================")
//            for i in myHeroesGame {
//                heroNumber += 1
//                print("\(heroNumber) - Le \( i.descriptionClassHero) - Vie : \(i.lifePoints) - Attaque : \(i.stuff.damage) - Soins : )")
//                    }
//            print("Choisissez un chiffre entre 1 et 4 pour choisir un héro.")
//            print("================================================================================")




    
    
    

}




