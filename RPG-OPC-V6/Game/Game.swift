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

            for i in 0..<2 {
                print("===================================")
                print("Joueur \(i+1), entrez votre pseudo : ")
                let team = createTeam()
                tabTeams.append(team)
            }

            fight()

        print("@@@@@@@@@@@@@@ End program  @@@@@@@@@@@@@@@ ")

    }
    func resumeTeams() {
        
        for i in 0..<tabTeams.count {
            print("Résumé de l'équipe \(i+1)")
            let team = tabTeams[i]
            team.statsTeams()
        }
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
   
    
    func fight() {
        print("=============================  Start Battle II  ===================================")
        print("LE COMBAT COMMENCE ! ")
        resumeTeams() // lister les équipes
        
        heroChoice()
        
        // choisir un membre de l'équipe 1
        // déterminer si c'est un mage ou un guerrier

    }
    
    
    
    func heroChoice() {
        var myFighter:Hero
        var myEnemy:Hero
        var heroChoicePlayer = 0
        repeat {
        for i in 0..<tabTeams.count {
 
            print("Joueur \(i+1) vous commencez : ")
            let team = tabTeams[i]
            
            print("Résumé de l'équipe \(i+1)")
            team.statsTeams()
            print("Joueur \(i+1), Choisissez un héro de votre équipe :")
            
            repeat{
                heroChoicePlayer = Input.myInputInt()
            } while heroChoicePlayer != 1 && heroChoicePlayer != 2 && heroChoicePlayer != 3

            myFighter = tabTeams[i].heroes[heroChoicePlayer - 1]
            
            print("Vous avez choisi \(myFighter.nameHero) le \(myFighter.descriptionClassHero)")
            
            if let magician = myFighter as? Magician {
                //afficher l'équipe allié
                print("===========================================")
                tabTeams[i-1].statsTeams()
                print("Choisissez un héros de votre équipe pour le soigner")
                
                repeat{
                    
                    heroChoicePlayer = Input.myInputInt()
                    
                } while heroChoicePlayer != 1 && heroChoicePlayer != 2 && heroChoicePlayer != 3
                
                myEnemy = tabTeams[i].heroes[heroChoicePlayer]
                print("Les points de vie de votre \(myEnemy.nameHero) le \(myEnemy.descriptionClassHero)  étaient de \(myEnemy.lifePoints)")
                magician.heal(target: myEnemy)
                print("Votre \(myEnemy.descriptionClassHero) a été soigné par votre \(myFighter.descriptionClassHero) pour \(myFighter.stuff.damage) de vie.")
                
                print("\(myEnemy.nameHero), le \(myEnemy.descriptionClassHero) est désormais de \(myEnemy.lifePoints) points de vie")
                // selectionne l'allié
                //ça le heal
                
                
            } else {
                print("===========================================")
                for i in tabTeams {
                tabTeams[i+1].statsTeams()
                }
                print("Choisissez un héros de l'équipe adverse pour l'attaquer : ")
                
                repeat{
                    
                    heroChoicePlayer = Input.myInputInt()
                    
                } while heroChoicePlayer != 1 && heroChoicePlayer != 2 && heroChoicePlayer != 3
                
                myEnemy = tabTeams[i + 1].heroes[heroChoicePlayer - 1]
             
                myFighter.attack(target: myEnemy)
                print("Votre enemi est : \(myEnemy.nameHero) le \(myEnemy.descriptionClassHero)")
                print("\(myFighter.nameHero) votre \(myFighter.descriptionClassHero) a infligé \(myFighter.stuff.damage) points de dégats à \(myEnemy.nameHero) le \(myEnemy.descriptionClassHero) enemi avec son arme \(myFighter.stuff.nameWeapon).")
                // afficher l'équiepe enemie
                // on le selecyionne
                // on l'attaque
            
            }
            
            print("===========================================")
            print("-----------Fin de la bataille--------------")
            print("-----------Résumé des équipes--------------")
            
            
            
                tabTeams[i].statsTeams()
            
        
       
            print("---------------La partie continue : Bataille Suivante- round \(i)")
            
              } // fin de la boucle for in
    } while tabTeams[0].heroes[0].deathHero() == false
    } // fin de la fonction heroChoice
    
    
} // fin de la class Game





