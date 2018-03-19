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
 var tabBattle = [Hero]()
    
    func startGame () {

            print("@@@@@@@ Start programm  @@@@@@@@@@ ")
            introStartGame()

            for i in 0..<2
            {
                print("===================================")
                print("Joueur \(i+1), entrez votre pseudo : ")
                let team = createTeam()
                tabTeams.append(team)
       
            }

            fight()
            print("Joueur 1, Choisissez un héro de votre équipe:")
            //startBattle()


    //            let team = createTeam()
    //            tabTeams.append(team)
             //   let test = tabTeams[i].heroes[i].stuff.damage
       
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
        
       
        print("func heroCHoice")
        print("Joueur X, Choisissez un héro de votre équipe :")
        
        for i in 0..<tabTeams.count {
            print("Joueur \(i+1) vous commencez : ")
            let team = tabTeams[i]
        
            print("Résumé de l'équipe \(i+1)")
            team.statsTeams()
            print("Joueur \(i+1), Choisissez un héro de votre équipe :")
            let heroChoicePlayer = Input.myInputInt()
            
            switch heroChoicePlayer {
                    case 1:
                        myFighter = self.tabTeams[i].heroes[0]
                        print("Vous avez choisi votre \(myFighter.descriptionClassHero)")
                        tabBattle.append(myFighter)
                    case 2:
                        myFighter = self.tabTeams[i].heroes[1]
                        print("Vous avez choisi votre \(myFighter.descriptionClassHero)")
                        tabBattle.append(myFighter)
                    case 3:
                        myFighter = self.tabTeams[i].heroes[2]
                       // fighters.append(attacker)
                        print("Vous avez choisi votre \(myFighter.descriptionClassHero)")
                        tabBattle.append(myFighter)
                    default:
                        break
            }
            

            print("Afficher l'équipe adverse:")
           
         
                
                 print("Résumé de l'équipe  \(i+2)")
            tabTeams[i+1].statsTeams()
            
                
                print("Choisissez un héros de l'équipe adberse. Tapez 1, 2 ou 3.")
                let HeroEnemyChoice = Input.myInputInt()
            
            
                switch HeroEnemyChoice {
                    
                    case 1:
                        myEnemy = self.tabTeams[i+1].heroes[0]
                        print("Vous avez choisi le \(myEnemy.descriptionClassHero) adverse")
                        print("\(myEnemy.descriptionClassHero) a \(myEnemy.lifePoints) points de vie.")
                        tabBattle.append(myEnemy)
                       
                    case 2:
                        myEnemy = self.tabTeams[i+1].heroes[1]
                        print("Vous avez choisi le \(myEnemy.descriptionClassHero) adverse")
                        print("\(myEnemy.descriptionClassHero) a \(myEnemy.lifePoints) points de vie.")
                        tabBattle.append(myEnemy)
                    case 3:
                        myEnemy = self.tabTeams[i+1].heroes[2]
                        print("Vous avez choisi le \(myEnemy.descriptionClassHero) adverse")
                        print("\(myEnemy.descriptionClassHero) a \(myEnemy.lifePoints) points de vie.")
                        tabBattle.append(myEnemy)
                    default:
                        break
                }
                battle2()
                print("------------------------------------Fin de la bataille")
                print("---------------La partie continue : Bataille Suivante")
            }
        }
    
//    func battle() {
//            print("le \(tabBattle[0].descriptionClassHero) attaque le \(tabBattle[1].descriptionClassHero) adverse.")
//        print("le \(tabBattle[0].descriptionClassHero), avec son arme \(tabBattle[0].stuff.nameWeapon) possède \(tabBattle[0].stuff.damage) d'attaque.")
//        print("le \(tabBattle[1].descriptionClassHero) a \(tabBattle[1].lifePoints) points de vie. Le \(tabBattle[1].descriptionClassHero) n'a plus que \(tabBattle[1].lifePoints - tabBattle[0].stuff.damage) points de vie.")
//        }
    func battle2() {
        print("func battle 2")
        for i in 0..<tabBattle.count {
            
            let heroBattle = tabBattle[i]
            let team = tabTeams[i]
            if heroBattle is Magician {
                print("Je suis un magicien")
                print("JE SUIS UN \(tabBattle[i].descriptionClassHero) et je soigne")
                print("Afficher l'équipe amie.")
                
              
                    print("\(team.statsTeams())")
                print("Votre \(tabBattle[i].descriptionClassHero) va soigner pour \(tabBattle[i].stuff.damage)")
                print("Votre \(tabBattle[i].descriptionClassHero) a soigné \(tabBattle[i+1].nameHero) le \(tabBattle[i+1].descriptionClassHero) il a désormais \(tabBattle[i+1].lifePoints + tabBattle[i].stuff.damage)")
                
                tabBattle.removeAll()
                print("..................fin du heal......................")
               break
            } else if heroBattle is Warrior || heroBattle is Dwarft || heroBattle is Colossus {
                
                print("le \(tabBattle[0].descriptionClassHero) attaque le \(tabBattle[1].descriptionClassHero) adverse.")
                print("le \(tabBattle[0].descriptionClassHero), avec son arme \(tabBattle[i].stuff.nameWeapon) enlève \(tabBattle[0].stuff.damage) points de vie ")
                print("\(tabBattle[1].nameHero)le \(tabBattle[1].descriptionClassHero) a \(tabBattle[1].lifePoints) points de vie. Désormais, \(tabBattle[1].nameHero) le \(tabBattle[1].descriptionClassHero) adverse a \(tabBattle[1].lifePoints - tabBattle[0].stuff.damage) points de vie.")
                tabBattle.removeAll()
                print(".................Fin des coups physiques.......................")
                break
                
            }
            
        }
        
        
    }
    
    }










//            for i in team.heroes {
//
//                if i is Magician {
//
//                    print("Vous avez choisi le \(i.descriptionClassHero)")
//
//
//                } else if i is Warrior || i is Dwarft || i is Colossus  {
////                    //afficher l'équipe adverse
////                    // combattant : lister l'équipe adverse - > il en choisi un et il attaque
////                    for i in 0..<tabTeams.count {
////                        let team = tabTeams[i]
////                        print("Voici l'équipe adverse -- \(i+1)")
////                        print("=======================")
////                        team.statsTeams()
////                      //  print("Vous avez choisi le \(i.descriptionClassHero), qui allez-vous attaquer ?")
////                        print("Choisissez un héros de l'équipe adverse \(i+1):")
////                        let heroChoicePlayer = Input.myInputInt()
////
////                        print(" l'équipe adverse est affiché")
////                       // team2.statsTeams()
////                        for i in 0..<team.heroes.count {
////
////                            print("ca marche ! ")
////                            print("ca marche \(i)")
////
////                             for i in team.heroes {
////
////                           if i is Warrior || i is Dwarft || i is Colossus || i is Magician {
////                                print("Le \(i.descriptionClassHero) qui se nomme \(i.nameHero) qui a désormais \(i.lifePoints - i.stuff.damage) a \(i.attackHero())")
////                            return
////                                }
////                        }
////                    }
////                }
//            }
//
//}
//        func menuChoseHeroTeam() {
//            let team = Team()
//            team.statsTeams()
//        let heroChoicePlayer = Input.myInputInt()
//        switch heroChoicePlayer {
//                case 1:
//                    print("Vous avez heal le hero1")
//                case 2:
//                    print("Vous avez heal le hero2")
//                case 3:
//                    print("Vous avez heal le hero3")
//                default:
//                    print("return")
//            }
//        }
