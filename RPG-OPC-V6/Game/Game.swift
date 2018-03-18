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
        print("func heroCHoice")
        print("Joueur X, Choisissez un héro de votre équipe :")
        print("Joueur 1 vous commencez : ")
        for i in 0..<tabTeams.count {
            let team = tabTeams[i]
            print("Résumé de l'équipe \(i+1)")
         
            repeat {
            team.statsTeams()
            print("Joueur \(i+1), Choisissez un héro de votre équipe :")
            let heroChoicePlayer = Input.myInputInt()
            
                
            } 
            for i in team.heroes {
                
                if i is Magician {
                    
                    print("Vous avez choisi le \(i.descriptionClassHero)")
                    
                    // mage : lister l'équipe 1 -> choisi le membre de son équipe -> il le soigne
                    team.statsTeams()
                    let heroChoicePlayer = Input.myInputInt()
                    print("Votre herochoiceplayerChoice \(heroChoicePlayer)")
                    return
                    
                } else if i is Warrior || i is Dwarft || i is Colossus  {
                    
                    //afficher l'équipe adverse
                    // combattant : lister l'équipe adverse - > il en choisi un et il attaque
                    for i in 0..<tabTeams.count {
                        
                        let team = tabTeams[i]
                        print("Voici l'équipe adverse -- \(i+1)")
                        print("=======================")
                        team.statsTeams()
                      //  print("Vous avez choisi le \(i.descriptionClassHero), qui allez-vous attaquer ?")
                        print("Choisissez un héros de l'équipe adverse \(i+1):")
                        let heroChoicePlayer = Input.myInputInt()
                        
                       
                        print(" l'équipe adverse est affiché")
                       // team2.statsTeams()
                        for i in 0..<team.heroes.count {
                           
                            print("ca marche ! ")
                            print("ca marche \(i)")
                            
                             for i in team.heroes {
                                
                           if i is Warrior || i is Dwarft || i is Colossus || i is Magician {
                                print("Le \(i.descriptionClassHero) qui se nomme \(i.nameHero) qui a désormais \(i.lifePoints - i.stuff.damage) a \(i.attackHero())")
                            return
                                }
                        }
                    }
                }
            }
  
}
        func menuChoseHeroTeam() {
            let team = Team()
            team.statsTeams()
        let heroChoicePlayer = Input.myInputInt()
        switch heroChoicePlayer {
                case 1:
                    print("Vous avez heal le hero1")
                case 2:
                    print("Vous avez heal le hero2")
                case 3:
                    print("Vous avez heal le hero3")
                default:
                    print("return")
            }
        }

 

}
}
}
