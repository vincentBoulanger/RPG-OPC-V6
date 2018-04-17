//
//  Game.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 07/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation

class Game { // create class GAme
    
 var tabTeams = [Team]()
    
    func startGame () { //

            print("@@@@@@@ Start programm  @@@@@@@@@@ ")
			print("Lancement de la partie.... ")
            introStartGame()
		
            for i in 0..<2 {
                print("===================================")
                print("Joueur \(i+1), entrez votre pseudo : ")
				createPseudoPlayer()
                let team = createTeam()
                tabTeams.append(team)
            }
	
            fight()
            showWinner()
        	print("@@@@@@@@@@@@@@ End program  @@@@@@@@@@@@@@@ ")

    }
	
    func resumeTeams() { // resume teams
        
        for i in 0..<tabTeams.count {
            print("Résumé de l'équipe \(i+1)")
            let team = tabTeams[i]
            team.statsTeams()
        }
    }
    
    
    func introStartGame() { // first display : Story
		
        print("===================")
        print("Vous pénétrez dans les catacombes au péril de votre vie !")
        print("L'ambiance est lugubre. Un frisson vous parcoure le dos. Après cette quête vous découvrirez qui vous êtes réellement! Vous avancez dans l'obscurité ! ")
        print("Soudain à la lueur d'une torche ! Vous vous retrouvez nez à nez avec une autre bande de mercenaires ! C'est l'affrontement ! La partie commence : ")
		
    }
	
	func createPseudoPlayer() {
		
		let userPseudoPlayer = ""
		repeat {
			if let data = readLine() {
				let	userPseudoPlayer = data
				print("Vous vous appelerez désormais \(userPseudoPlayer)")
				}
		} while userPseudoPlayer != ""
	}

	
    func createTeam() -> Team { // composer une équipe
        let team = Team()
        team.createHeroes()
        return team
    }

    
    func fight() {
        print("=============================  Start Battle  ===================================")
        print("LE COMBAT COMMENCE ! ")
		
        resumeTeams() // lister les équipes
 
        var myFighter:Hero
        var myEnemy:Hero
        
        var heroChoicePlayer = 0
        repeat {
            for i in 0..<tabTeams.count {
                
                let team = tabTeams[i]
                
                print("Joueur \(i+1), à votre tour : ")
                
                print("Résumé de l'équipe \(i+1)")
                team.statsTeams()
                print("Joueur \(i+1), Choisissez un héro de votre équipe :")
                
                repeat{
						heroChoicePlayer = 0
						if let data = readLine() {
							if let dataToInt = Int(data) {
								heroChoicePlayer = dataToInt
							}
						}
                } while heroChoicePlayer != 1 && heroChoicePlayer != 2 && heroChoicePlayer != 3
                
                myFighter = tabTeams[i].heroes[heroChoicePlayer - 1]
				magicBox(hero: myFighter)
				
                if let magician = myFighter as? Magician {
					
                    print("===========================================")
                    tabTeams[i].statsTeams()
					
                    print("Choisissez un héros de votre équipe pour le soigner")
					
                    repeat{
                        
						if let data = readLine() {
							if let dataToInt = Int(data) {
								heroChoicePlayer = dataToInt
							}
						}
                        
                    } while heroChoicePlayer != 1 && heroChoicePlayer != 2 && heroChoicePlayer != 3
					
					eventRandom(team: tabTeams[i])
					magicBox(hero: myFighter)
					
                    myEnemy = tabTeams[i].heroes[heroChoicePlayer - 1]
					
                    print("Les points de vie de votre \(myEnemy.nameHero) le \(myEnemy.descriptionClassHero)  étaient de \(myEnemy.lifePoints)")
					
                    magician.heal(target: myEnemy)
					
                    print("Votre \(myEnemy.descriptionClassHero) a été soigné par votre \(myFighter.descriptionClassHero) pour \(myFighter.stuff.damage) de vie.") // ->
                    print("\(myEnemy.nameHero), le \(myEnemy.descriptionClassHero) est désormais de \(myEnemy.lifePoints) points de vie")
					//les mettre dans la fonction hero
					
                } else {
                    print("===========================================")
                    
                    if i == 0 {
						
                        let myEnemyTeam = tabTeams[i+1]
                        
                        myEnemyTeam.statsTeams()
                        
                        print("Joueur \(i+1),Choisissez un héros de l'équipe adverse pour l'attaquer : ")
						
                        repeat{
                            
							if let data = readLine() {
								if let dataToInt = Int(data) {
									heroChoicePlayer = dataToInt
								}
							}
                            
                        } while heroChoicePlayer != 1 && heroChoicePlayer != 2 && heroChoicePlayer != 3
						
                       	eventRandom(team: tabTeams[i])
						magicBox(hero: myFighter)
						
                        myEnemy = myEnemyTeam.heroes[heroChoicePlayer - 1]
                        
                        myFighter.attack(target: myEnemy)
						
                        print("Vous avez choisi comme enemi : \(myEnemy.nameHero) le \(myEnemy.descriptionClassHero)")
                        print("\(myFighter.nameHero) votre \(myFighter.descriptionClassHero) a infligé \(myFighter.stuff.damage) points de dégats à \(myEnemy.nameHero) le \(myEnemy.descriptionClassHero) enemi avec son arme \(myFighter.stuff.nameWeapon).")
						
						
                        if  myEnemyTeam.deathTeams() {
                            return
                        }
                        
                    } else {
						
                        let myEnemyTeam = tabTeams[i-1]
                        
                        myEnemyTeam.statsTeams()
                        
                        print("Joueur \(i+1),Choisissez un héros de l'équipe adverse pour l'attaquer : ")
                        
                        repeat{
							// remplace la class input.
							heroChoicePlayer = 0
							
							if let data = readLine() {
								if let dataToInt = Int(data) {
									heroChoicePlayer = dataToInt
								}
							}
                            
                        } while heroChoicePlayer != 1 && heroChoicePlayer != 2 && heroChoicePlayer != 3
                        
                        myEnemy = myEnemyTeam.heroes[heroChoicePlayer - 1]
                        
                        myFighter.attack(target: myEnemy)
						
                        print("Votre enemi est : \(myEnemy.nameHero) le \(myEnemy.descriptionClassHero)")
						
                        print("\(myFighter.nameHero) votre \(myFighter.descriptionClassHero) a infligé \(myFighter.stuff.damage) points de dégats à \(myEnemy.nameHero) le \(myEnemy.descriptionClassHero) enemi avec son arme \(myFighter.stuff.nameWeapon).")
                        // afficher l'équiepe enemie
                        // on le selectionne
                        // on l'attaque
				
                        if  myEnemyTeam.deathTeams() {
							
                            return
                        }
                    }
                }
                } // fin de la boucle for in
            
        } while true
        
        // choisir un membre de l'équipe 1
        // déterminer si c'est un mage ou un guerrier

    }
    
    func showWinner () { // function to call the resume team and show the winner

        print("=======================================================================")
        print("-------------------------Fin de la bataille----------------------------")
        print("-------------------------Résumé des équipes----------------------------")
        
        resumeTeams() //  les équipes sont listées à la fin du round
        
        getWinner()

    }
    
    func getWinner() { // function to show the winner
       
        for i in 0..<tabTeams.count {
          let team = tabTeams[i]
            if !team.deathTeams() {
                print("Bravo ! L'équipe \(i+1) a gagné ! ")
				print("--------------- FIN DE LA PARTIE ")
            }
        }
    }
	

	
	
	func magicBox(hero: Hero) {
		
		let random = arc4random_uniform(100)
		
		if random <= 20 {
			print("============= Event aléatoire : Le loot ou la vie ?  =============")
			print("Soudain la roche s'effondre laissant apparaître un vieux coffre. Vous l'ouvrez ! BRAVO !!!! Vous vous êtes emparé de l'épée des milles vérités.")
			let newArm = SwordfOfThe1000Truths()
			hero.stuff = newArm
			print("=======================================================================")
			
		}
		
	}
	
	func eventRandom(team : Team) {
		
		let eventRandom = arc4random_uniform(20)
		
		if eventRandom <= 10 {
			
			print("============= Event aléatoire : Les dieux s'en mêlent ! =============")
			print("Les dieux vous observaient depuis le début. Fatigués de vos chamailleries, ils décident d'intervenir à leur bon gré.")
			print("Résulat : Une boule de feu traverse le champ de bataille. ")
			print("Tous les combattants de l'équipe adverse ont perdu 20 points de vie.")
			print("=======================================================================")
			
			for i in 0..<team.heroes.count {
				
				let hero = team.heroes[i]
				
				if hero.lifePoints >= 1 {
					
					hero.lifePoints -= 20
					
				}
			}
		}
	}
}
