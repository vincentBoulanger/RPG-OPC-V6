//
//  Game.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 07/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation

class Game {
    
 var tabTeams = [Team]() // board bringing the teams together
    
    func startGame () { // spine of the program  - > similary to appDelegate ?

            print("@@@@@@@ Start programm  @@@@@@@@@@ ")
            introStartGame()
		
            for i in 0..<2 {
                print("===================================")
                print("Joueur \(i+1), entrez votre pseudo : ")
				
                let team = createTeam()
                tabTeams.append(team)
            }
		
            fight()
            showWinner()
        	print("@@@@@@@@@@@@@@ End program  @@@@@@@@@@@@@@@ ")

    	}
	
    func resumeTeams() { // team selectionned resume
        
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
	func createPseudoHeroes() {

	}
	func createPseudoPlayer() { // choose a nickname
		let userPseudoPlayer = ""
		repeat {
			
		if let data = readLine() {
				let	userPseudoPlayer = data
				print("Vous vous appelerez désormais \(userPseudoPlayer)")
			}
			
			} while userPseudoPlayer != ""
	}
	
    func createTeam() -> Team { // compose a team
		print("Entrez le nom de votre équipe : ")
		var teamName = ""
		repeat {
			
		 // call the function describe Hero display
			// input selection hero's player
			
			if let data = readLine() {
				teamName = data
			}
		} while teamName == ""
		let team = Team(name: teamName)
        team.createTeamHeroes()
        return team
    }
    
    func fight() {
		
//		select a team member
//		determine if he is a healer or a attack hero
//		a member of the opposing team is selected if it is a warrior or displays the friendly team if the player has chosen a magician
//		 the hero attacks the enemy or the magician heals an allied character
//  	random activation of the magic loot
//		random activation bonus'game
		
        print("=============================  Start Battle  ===================================")
        print("LE COMBAT COMMENCE ! ")
        resumeTeams() // list characters's list
 
        var myFighter:Hero
        var myEnemy:Hero
        var heroChoicePlayer = 0
		
        repeat {
            for i in 0..<tabTeams.count {
                
                let team = tabTeams[i]
                
                print("Joueur \(i+1) vous commencez : ")
                
                print("Résumé de l'équipe \(i+1)")
                team.statsTeams()
                print("Joueur \(i+1), Choisissez un héro de votre équipe :")
                
                repeat{
					
					heroChoicePlayer = 0
					
					if let data = readLine() { // input with readLine , unwrapping the optional and convert String to Data
						if let dataToInt = Int(data) {
							heroChoicePlayer = dataToInt
						}
					}
                } while heroChoicePlayer != 1 && heroChoicePlayer != 2 && heroChoicePlayer != 3
                
                myFighter = tabTeams[i].heroes[heroChoicePlayer - 1]
				
				magicBox(hero: myFighter) // launch magic loot
				
                
                if let magician = myFighter as? Magician { // determine if the hero ' selectionned are
					
                    print("===========================================")
                    tabTeams[i].statsTeams() // display stats friend's team
					
                    print("Choisissez un héros de votre équipe pour le soigner")
					
                    repeat{
                        
						if let data = readLine() { // input with readLine , unwrapping the optional and convert String to Data
							if let dataToInt = Int(data) {
								heroChoicePlayer = dataToInt
							}
						}
                        
                    } while heroChoicePlayer != 1 && heroChoicePlayer != 2 && heroChoicePlayer != 3
					
                    myEnemy = tabTeams[i].heroes[heroChoicePlayer - 1]
                    print("Les points de vie de votre \(myEnemy.nameHero) le \(myEnemy.descriptionClassHero)  étaient de \(myEnemy.lifePoints)")
					
                    magician.heal(target: myEnemy)
                    print("Votre \(myEnemy.descriptionClassHero) a été soigné par votre \(myFighter.descriptionClassHero) pour \(myFighter.stuff.damage) de vie.")
                    print("\(myEnemy.nameHero), le \(myEnemy.descriptionClassHero) est désormais de \(myEnemy.lifePoints) points de vie")
					
                } else {
					
                    print("===========================================")
                    
                    if i == 0 {
						
                        let myEnemyTeam = tabTeams[i+1]
                        
                        myEnemyTeam.statsTeams()
                        
                        print("Joueur \(i+1),Choisissez un héros de l'équipe adverse pour l'attaquer : ")
						
                        repeat{
                            
							if let data = readLine() { // input with readLine , unwrapping the optional and convert String to Data
								if let dataToInt = Int(data) {
									heroChoicePlayer = dataToInt
								}
							}
                            
                        } while heroChoicePlayer != 1 && heroChoicePlayer != 2 && heroChoicePlayer != 3
						
						
                        myEnemy = myEnemyTeam.heroes[heroChoicePlayer - 1]
                        
                        myFighter.attack(target: myEnemy)
						
                        print("Votre enemi est : \(myEnemy.nameHero) le \(myEnemy.descriptionClassHero)")
                        print("\(myFighter.nameHero) votre \(myFighter.descriptionClassHero) a infligé \(myFighter.stuff.damage) points de dégats à \(myEnemy.nameHero) le \(myEnemy.descriptionClassHero) enemi avec son arme \(myFighter.stuff.nameWeapon).")
						
                        if  myEnemyTeam.deathTeams() {
                            return
                        }
                        
                    } else {
						
                        let myEnemyTeam = tabTeams[i-1]
                        
                        myEnemyTeam.statsTeams()
                        
                        print("Joueur \(i+1),Choisissez un héros de l'équipe adverse pour l'attaquer : ")
                        
                        repeat{
							heroChoicePlayer = 0
							
							if let data = readLine() { // input with readLine , unwrapping the optional and convert String to Data
								if let dataToInt = Int(data) {
									heroChoicePlayer = dataToInt
								}
							}
                            
                        } while heroChoicePlayer != 1 && heroChoicePlayer != 2 && heroChoicePlayer != 3
                        
                        myEnemy = myEnemyTeam.heroes[heroChoicePlayer - 1]
                        
                        myFighter.attack(target: myEnemy)
						
                        print("Votre enemi est : \(myEnemy.nameHero) le \(myEnemy.descriptionClassHero)")
						
                        print("\(myFighter.nameHero) votre \(myFighter.descriptionClassHero) a infligé \(myFighter.stuff.damage) points de dégats à \(myEnemy.nameHero) le \(myEnemy.descriptionClassHero) enemi avec son arme \(myFighter.stuff.nameWeapon).")
					
                        if  myEnemyTeam.deathTeams() {
							
                            return
                        }
                    }
                }
                } // fin de la boucle for in
            
        } while true
    }
    
    func showWinner () { // display the winner of the game

        print("=======================================================================")
        print("-------------------------Fin de la bataille----------------------------")
        print("-------------------------Résumé des équipes----------------------------")
        
        resumeTeams() //  les équipes sont listées à la fin du round
        
        getWinner()

    }
    
    func getWinner() {
		// check if all the element of a team are dead. If it 's right. The function determine the winner
       	// display the 'end's game
        for i in 0..<tabTeams.count {
          let team = tabTeams[i]
            if !team.deathTeams() {
                print("Bravo ! Le gagnant est l'équipe \(i+1)")
				print("--------------- FIN DE LA PARTIE ")
            }
        }
    }
	
	func goCheckName(){ // check the name's player team
//		for i in 0..<tabTeams.count {
//			let team = tabTeams[i]
//			team.checkName()
//		}
	}
	
	func magicBox(hero: Hero) {
		// roll of the dice to activate the loot box
		// the event random distribute new stuff to a teammate
		let random = arc4random_uniform(100)
		
		if random <= 20 {
			print("BRAVO ! Vous avez trouvé l'épée des milles vérités.")
			let newArm = SwordfOfThe1000Truths()
			hero.stuff = newArm
		}
	} //end's func magicBox
	
	func eventRanDom(team : Team) {
		// roll of the dice to activate the event random
		// the event random distribute 20 points of damage to opposing team
		let eventRandom = arc4random_uniform(20)
		
		if eventRandom == 1 {
			
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
	} // end's func eventRandom
	
	
//	func checkAllTeamPseudo() -> Bool {
//
////		//	if nameHeroTeam.contains("\(nameHeroTeam)") {
////		var checkNameHeroTeamIsOk:Bool = false
////		repeat {
////
////			for i in 0..<tabTeams.count {
////				let team = tabTeams[i]
////				print("print tabteams i \(team)")
////				print("@@@@@@@@@@@@@@@@   affiche l'équipe \(i+1)")
////				for i in 0..<team.heroes.count {
////
////						let hero = team.heroes[i]
////
////						if hero.nameHero == hero.nameHero {
////
////							print("Les équipes possèdent des homonymes.")
////							print("Vous devez renommer vos héros.")
////							//let team = Team()
////							team.namingHero()
////							checkNameHeroTeamIsOk = false
////							return checkNameHeroTeamIsOk
////
////						} else {
////
////							print("Les équipes sont OK. La partie va pouvoir commencer.")
////							checkNameHeroTeamIsOk = true
////							return checkNameHeroTeamIsOk
////						}
////					}
////				}
////		} while checkNameHeroTeamIsOk == true
////		return checkNameHeroTeamIsOk
//	}

} // end's class game
