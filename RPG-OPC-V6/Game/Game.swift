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
            for i in 0..<2 {
                print("===================================")
                print("Joueur \(i), entrez votre pseudo : ")
                let team = createTeam()
                tabTeams.append(team)
            }
            fight()
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
   
    
    func fight(){
        resumeTeams()
        // lister les équipes
        // choisir un membre de l'équipe 1
        // déterminer si c'est un mage ou un guerrier
        // mage : lister l'équipe 1 -> choisi le membre de son équipe -> il le soigne
        // combattant : lister l'équipe adverse - > il en choisi un et il attaque
        //
        
    }
    
    func startBattle() {
        print("=============================  Start Battle  ===================================")
        print("LE COMBAT COMMENCE ! ")
        //statsTeams()
        print("Joueur 1, choisissez un membre de votre équipe :")
        choseMyHero()
        choseHeroEnemy()
        selectionFriendOrEnemy()
    }
    
    func choseMyHero(){
        
        let heroChoicePlayer = Input.myInputInt()
        // tant que il y a un hero en vie
    //   while team.heroes[0].attackHero() == true  {
        switch heroChoicePlayer {
                case 1:
                    tabBattle.append(tabTeams[0].heroes[0])
                case 2:
                    tabBattle.append(tabTeams[0].heroes[1])
                case 3:
                    tabBattle.append(tabTeams[0].heroes[2])
                default:
                    print("return")
                }
        print("Vous avez choisi le \(tabBattle[0]) de votre équipe")
       // }
    }
        

        func choseHeroEnemy()  {
        let team = Team()
        print("Choisisssez un héro de l'équipe adverse :")
        let heroChoiceEnemy = Input.myInputInt()
            
        switch heroChoiceEnemy {
                case 1:
                    tabBattle.append(tabTeams[1].heroes[0])
                case 2:
                    
                    tabBattle.append(tabTeams[1].heroes[1])
                case 3:
                    
                    tabBattle.append(tabTeams[1].heroes[2])
                default:
                    print("return")
            }
            print(" table count : \(tabBattle.count)")
            print("Vous avez choisi l'enemi \(tabBattle[1].nameHero)")
        }
    
        
        func selectionFriendOrEnemy() {
            
        for i in tabBattle {

            if i.descriptionClassHero == "WARRIOR" ||  i.descriptionClassHero == "NAIN" || i.descriptionClassHero == "COLOSSE" { // controler vos types 

                print("MENU pour choisir un enemy ")
                print("le héros choisi attaque ")
                choseHeroEnemy()
                
               // i.attackHero()
            } else if i.descriptionClassHero == "MAGICIEN" {

                print("choisir un héro allié")
               choseMyHero()
                // healHero
                print("Vous avez soigné ce héros")
            }
        }
    }

    }
    
    
//    func choseEnemy() {
//        let team = Team()
//        var tabBattle = [Hero]()
//        print("Choisis un héros ennemi")
//        let heroChoicePlayer = team.myInputInt()
//
//        switch heroChoicePlayer {
//        case 1:
//            print("4 - \(tabTeams[1].heroes[0].nameHero), le \(tabTeams[1].heroes[0].descriptionClassHero) possède \(tabTeams[1].heroes[0].lifePoints) de vie et une attaque de \(tabTeams[0].heroes[0].stuff.damage)")
//            tabBattle.append(tabTeams[0].heroes[0])
//        case 2:
//            print("4 - \(tabTeams[1].heroes[1].nameHero), le \(tabTeams[1].heroes[1].descriptionClassHero) possède \(tabTeams[1].heroes[1].lifePoints) de vie et une attaque de \(tabTeams[1].heroes[1].stuff.damage)")
//            tabBattle.append(tabTeams[0].heroes[1])
//        case 3:
//            print("4 - \(tabTeams[1].heroes[2].nameHero), le \(tabTeams[1].heroes[2].descriptionClassHero) possède \(tabTeams[1].heroes[2].lifePoints) de vie et une attaque de \(tabTeams[0].heroes[2].stuff.damage)")
//            tabBattle.append(tabTeams[0].heroes[2])
//        default:
//            print("return")
//        }
//        print("Vous  avez choisi le \(tabBattle.description)")
//    }
    
    
    

