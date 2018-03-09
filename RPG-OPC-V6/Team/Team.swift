//
//  Team.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 01/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation


class Team {
    
    var heroes = [Hero]()

    
    func describeHeroMenu(){

        print("================================================================================")
        print("1 - Guerrier - Vie: 100 - Attaque: 10")
        print("2 - Colosse  - Vie: 150 - Attaque: 5 ")
        print("3 - Nain     - Vie: 130 - Attaque: 30 ")
        print("4 - Magicien - Vie: 80  - Soins  : 20")
        print("================================================================================")
        print("Choisissez un héros en tapant un chiffre entre 1 et 4 ===========================")
    }
    
    func createHeroes() { // create player/pseudo 1 and 2, cette fonction remplit le tab ligne 14 avec 3 PERSO
        
                let userPseudoPlayer = myInputString()
        
                print("Vous vous appelerez désormais \(userPseudoPlayer)")
        
        for _ in 1...3 {
            var userChoiceTeam = 0
            describeHeroMenu()
            repeat {
               userChoiceTeam = myInputInt()
        } while userChoiceTeam != 1 && userChoiceTeam != 2 && userChoiceTeam != 3 && userChoiceTeam != 4
            
                    switch userChoiceTeam {
                        
                        case 1:
                            print("\(userPseudoPlayer) Vous avez ajouté un guerrier.")
                            heroes.append(Warrior())
                        //namingHero()
                        case 2:
                            print("\(userPseudoPlayer) Vous avez ajouté un colosse.")
                            heroes.append(Colossus())
                        //namingHero()
                        case 3:
                            print("\(userPseudoPlayer) Vous avez ajouté un nain.")
                            heroes.append(Dwarft())
                        //namingHero()
                        case 4:
                            print("\(userPseudoPlayer) Vous avez ajouté un magicien.")
                            heroes.append(Magician())
                       // namingHero()
                        default:
                           return
                            print("Veuillez entrer un chiffre entre 1 et 3")
                    }
            //} while userChoiceTeam == 1 || userChoiceTeam == 2 || userChoiceTeam == 3 || userChoiceTeam == 4
        
        }
    namingHero()
    }
    func namingHero() {
            for i in heroes {
                    print("")
                    print("Choisissez un pseudo pour votre : \(i.descriptionClassHero)")
                    let pseudoHero = myInputString()
                    i.nameHero = pseudoHero
                    print("")
                    print(" Votre \(i.descriptionClassHero ) s'appelle  \(i.nameHero)" )
            }
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
    
    
    
    
    
    

//       func teamDescription() { // faire un print
//            var heroNumber = 0
//            print("================================================================================")
//            for i in myHeroesGame {
//                heroNumber += 1
//                print("\(heroNumber) - Le \( i.descriptionClassHero) - Vie : \(i.lifePoints) - Attaque : \(i.stuff.damage) - Soins : )")
//                    }
//            print("Choisissez un chiffre entre 1 et 4 pour choisir un héro.")
//            print("================================================================================")




    
    
    
    
   
    





