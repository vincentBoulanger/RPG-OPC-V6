//
//  Team.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 01/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation


class Team { // team 's display
	// hero's section
	// hero's naming
    
    var heroes = [Hero]() // create empty tab hero
	var nameHeroes = [String]()
	let name:String
	init(name:String) {
		self.name = name
	}
    func describeHeroMenu() { // selection hero menu display

		print("==============================================================")
		print("1 - Warrior   - Life: 100 - Attack: 10")
		print("2 - Colossus  - Life: 150 - Attack: 5 ")
		print("3 - Dwarft    - Life: 70  - Attack: 30 ")
		print("4 - Sorcerer  - Life: 80  - Heal  : 20")
		print("==============================================================")
		print("Choose a hero by typing a number between 1 and 4 ========")
    }
	
    func createTeamHeroes() {
		// the player chose and 3 heroes to his team
		// the player names his 3 heroes
		// nickname 's verification to know if two heroes don't have the same name
		
        for _ in 0..<3 {
                var userChoiceTeam = 0
				repeat {
					
					describeHeroMenu()   // call the function describe Hero display
					// input selection hero's player
					
					if let data = readLine() {
						if let dataToInt = Int(data) {
							userChoiceTeam = dataToInt
						}
					}
				} while userChoiceTeam != 1 && userChoiceTeam != 2 && userChoiceTeam != 3 && userChoiceTeam != 4
			
            let heroName = CheckNames.shared.uniqueHeroName()
		
				switch userChoiceTeam { // the player's choices are compared with the proposition's game
                        
                        case 1:
                            print("You added a warrior")
							heroes.append(Warrior(name:heroName))
					
                        case 2:
                            print("You added a colossus.")
                            heroes.append(Colossus(name:heroName))
					
                        case 3:
                            print("You added a dwarft.")
							heroes.append(Dwarft(name:heroName))
                        case 4:
                            print("You added a sorcerer.")
                            heroes.append(Magician(name:heroName))
                        default:
                           return
                        }
                    }
		
            } // end func createHeroes

	
    func statsTeams() { // different text are displaying if the hero heal or attack or is dead
		
			for i in 0..<heroes.count {
				
				let hero = heroes[i]
				
				if hero.lifePoints >= 1 {
					
					if hero is Magician {
						
						print("\(i+1) - \(hero.nameHero), the \(hero.descriptionClassHero) has \(hero.lifePoints) of life and can heal 30 life's points.")
						
					} else if hero is Warrior || hero is Dwarft || hero is Colossus {
						
						print("\(i+1) - \(hero.nameHero), the \(hero.descriptionClassHero) has \(hero.lifePoints) of life and \(hero.stuff.damage) attack's points.")
						
					}
					
				} else {
					print("\(i+1) - \(hero.nameHero), the \(hero.descriptionClassHero) is dead.")
				}
			}
			print("==================================================================")
		} // end func StatsTeams
	
    
    
    func deathTeams() -> Bool { // function to determine if a hero is dead
        
        var isDead = false
        for hero in heroes {
            if hero.lifePoints == 0 {
                isDead = true
            } else {
                return false
            }
        }
        return isDead
    } //end func deathTeam
	
}// end class team

