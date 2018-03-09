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
            }
            print("")
            print("LE COMBAT COMMENCE ! ")
            print("Résumé des deux équipes")
            print("")
            statsTeams()
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
    func statsTeams() {
    
            print("L'équipe () se compose de : ")
            print("")
        // let team = tabTeams[i].heroes[i].stuff.damage
        for team in tabTeams {
            print("\(team)")
            print("\(team.heroes)")
            for i in 1...2 {
                print("L'équipe \(i)")
                print("print team natif\(team)")
                print("team heroes sans i\(team.heroes)")
                print("team heroes avec i\(team.heroes[i])")
                print("test des i avec \(team.heroes[i].descriptionClassHero) \(team.heroes[i].lifePoints) \(team.heroes[i].nameHero)")
                print("\(team.heroes[i].descriptionClassHero)")
                
            }
        }
        
           // print("\(i.heroes[i].descriptionClassHero)")
      //  let test2 = self.tabTeams[i].heroes[i].descriptionClassHero
        }
//        var user2: PFUser
//        guard let userObject = self.objects?[indexPath.row] else {
//            //handle the case of 'self.objects' being 'nil' and exit the current scope
//        }
        //user2 = userObject as! PFUser
       // let test = teams
        
//        for i in test {
//            i.heroes[0].descriptionClassHero
//        }
//            for i in tabTeams {
//            print("\(i)")
//           print("\(i.heroes[0].nameHero), le\(i.heroes[0].descriptionClassHero) possède \(i.heroes[0].lifePoints) de vie et une attaque de \(i.heroes[0].stuff.damage)")
//                for j in i {
//                print("\(i.heroes[0] )")
//                print("\(i.heroes[2] )")
//                for j in i {
//                    print("\(i)")
//                }
                }

        
           // print(" Votre \(hero.heroes[0].descriptionClassHero) ")//s'appelle \(hero.heroes[i].nameHero),dispose de \(hero.heroes[i].lifePoints) points de vie." )
     
    
    

