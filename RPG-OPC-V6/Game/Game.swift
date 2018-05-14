//
//  Game.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 07/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation

class Game {
 var tabTeams = [Team]() // array bringing the teams together
    func startGame () { // spine of the program

            print("@@@@@@@ Start programm  @@@@@@@@@@ ")
            introStartGame()
            for i in 0..<2 {
                print("===================================")
                print("Player \(i+1), enter your nickname: ")
                let team = createTeam()
                tabTeams.append(team)
            }
            fight()
            showWinner()
        	print("@@@@@@@@@@@@@@ End program  @@@@@@@@@@@@@@@ ")
    	}
	
	
	// team selectionned resume
    func resumeTeams() {
        for i in 0..<tabTeams.count {
            print("Team Summary \(i+1)")
            let team = tabTeams[i]
            team.statsTeams()
        }
    }
    
    // first display : Story
    func introStartGame() {
		print("=====================")
		print("You enter the catacombs at the risk of your life !")
		print("The atmosphere is gloomy. A shiver runs down your back. After this quest you will discover who you really are! You advance in darkness ")
		print("Suddenly by the light of a torch ! You find yourself face to face with another bunch of mercenaries! It's the confrontation! The game begins : ")
    }

	// choose a nickname
	func createPseudoPlayer() {
		let userPseudoPlayer = ""
		repeat {
		if let data = readLine() {
				let	userPseudoPlayer = data
				print("From now on, your name will be \(userPseudoPlayer)")
			}
			
			} while userPseudoPlayer != ""
	}
	
	
	// compose a team
    func createTeam() -> Team {
        
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
	
	// func fight definition
	//		select a team member
	//		determine if he is a healer or a attack hero
	//		a member of the opposing team is selected if it is a warrior or displays the friendly team if the player has chosen a magician
	//		 the hero attacks the enemy or the magician heals an allied character
	//  	random activation of the magic loot
	//		random activation bonus'game
    func fight() {
		
        print("=============================  Start Battle  ===================================")
        print("THE FIGHT BEGINS ! ")
        resumeTeams() // list characters's list
        var myFighter:Hero
        repeat {
            for i in 0..<tabTeams.count {
                let team = tabTeams[i]
                print("===========================================")
                print("Player \(i+1), it's your turn : ")
				print("Team summary \(i+1) : ")
				print("===========================================")
                team.statsTeams()
                print("Player \(i+1), choose a hero from your team :")
                myFighter = tabTeams[i].heroes[userChoice() - 1]
				magicBox(hero: myFighter) // launch magic loot
                eventRanDom(team: tabTeams[i])
			
                if let magician = myFighter as? Magician { // determine if the hero ' selectionned are
                    print("===========================================")
                    tabTeams[i].statsTeams() // display stats friend's team
                    print("Choose a hero from your team to heal him")
                    magician.heal(target: tabTeams[i].heroes[userChoice() - 1])
                } else {
                    print("===========================================")
                    if i == 0 {
                        let myEnemyTeam = tabTeams[i+1]
						fightStatement(enemyTeam: myEnemyTeam, fighter: myFighter, index: i)
                        if myEnemyTeam.deathTeams() { // check if the enemy is dead
                            return
                        }
                    } else {
                        let myEnemyTeam = tabTeams[i-1]
						fightStatement(enemyTeam: myEnemyTeam, fighter: myFighter, index: i)
                        if myEnemyTeam.deathTeams() {
                            return
                        }
                    }
                }
			} // fin de la boucle for in
        } while true
    }
	
	
	// combat phase: hero enemy selectionned + prompt + call attack function
	func fightStatement(enemyTeam:Team, fighter:Hero, index:Int) {
		enemyTeam.statsTeams() // display the statistcs of the enemy 's team
		print("Player \(index+1), choose a hero from the opposing team to attack him : ")
		let myEnemy = enemyTeam.heroes[userChoice() - 1]
		fighter.attack(target: myEnemy)
	}
	
	
	// command prompt in a repeat loop. As long as the command prompt does not return a digit, the command prompt is displayed again.
	func userChoice() -> Int {
		var heroChoicePlayer = 0
		repeat{
			if let data = readLine() { // input with readLine , unwrapping the optional and convert String to Data
				if let dataToInt = Int(data) {
					heroChoicePlayer = dataToInt
				}
			}
		} while heroChoicePlayer != 1 && heroChoicePlayer != 2 && heroChoicePlayer != 3
		return heroChoicePlayer
	}

	
	// display the winner of the game
    func showWinner () {

        print("=======================================================================")
        print("-------------------------End of battle----------------------------")
        print("-------------------------Team summaries----------------------------")
        
        resumeTeams() //  teams are listed at the end of the round
        getWinner() // determine the winner

    }
	
	
	// check if all the element of a team are dead. If it 's right. The function determine the winner
	// display the 'end's game
    func getWinner() {
        for i in 0..<tabTeams.count {
          let team = tabTeams[i]
            if !team.deathTeams() {
                print("Great ! The winning team \(i+1)")
				print("--------------- End of game ")
            }
        }
    }
	
	
	// roll of the dice to activate the loot box
	// the event random distribute new stuff to a teammate
	func magicBox(hero: Hero) {
		let random = arc4random_uniform(100)
		if hero.lifePoints >= 1 {
			if random <= 99 {
				if hero is Magician {
					print("Great ! You found The cane of Lazarus !")
					let newArm = CaneOfLazarus()
					hero.stuff = newArm
				} else {
					// ajuter une arme
					print("Great ! You found the sword of a thousand truths")
					let newArm = SwordfOfThe1000Truths()
					hero.stuff = newArm
				}
			}
		}
	}
	
	
	// roll of the dice to activate the event random
	// the event random distribute 20 points of damage to opposing team
	func eventRanDom(team : Team) {
		let eventRandom = arc4random_uniform(100)
		if eventRandom <= 5 {
			print("============= Random event : The gods get involved ! =============================")
			print("The gods were watching you from the beginning. Tired of your bickering, they decide to play with you.")
			print("Result: A fireball crosses the battlefield.")
			print("Your team lose 20 health points.")
			print("The dead wake up")
			print("===================================================================================")
			for i in 0..<team.heroes.count {
				let hero = team.heroes[i]
				if hero.lifePoints >= 21 {
					hero.lifePoints -= 20
				} else if hero.lifePoints <= 0 {
					hero.lifePoints = 20
					print("\(hero.nameHero)The dead come back to life .")
				}
			}
		}
	}
} // end's class game
