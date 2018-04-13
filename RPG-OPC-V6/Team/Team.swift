//
//  Team.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 01/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation


class Team {
    
    var heroes = [Hero]() // create empty tab hero

    func describeHeroMenu() { // selection hero menu display

		print("==============================================================")
		print("1 - Guerrier - Vie: 100 - Attaque: 10")
		print("2 - Colosse  - Vie: 150 - Attaque: 5 ")
		print("3 - Nain     - Vie: 130 - Attaque: 30 ")
		print("4 - Magicien - Vie: 80  - Soins  : 20")
		print("==============================================================")
		print("Choisissez un héros en tapant un chiffre entre 1 et 4 ========")
    }
	
	func createPseudoPlayer() -> String {
		let userPseudoPlayer = ""
		
		print("Vous vous appelerez désormais \(userPseudoPlayer)")
		return userPseudoPlayer
	}
	
    func createHeroes() {
		
			describeHeroMenu()
		
        for _ in 0..<3 {
            
                var userChoiceTeam = 0
                 // call the function describe Hero Menu
            
				repeat {
					describeHeroMenu()
					// input selection hero's player
					userChoiceTeam = 0
					
					if let data = readLine() {
						if let dataToInt = Int(data) {
							userChoiceTeam = dataToInt
						}
					}
				} while userChoiceTeam != 1 && userChoiceTeam != 2 && userChoiceTeam != 3 && userChoiceTeam != 4
            
				switch userChoiceTeam { // the player's choices are compared with the prpposition's game
                        
                        case 1:
                            print("\(createPseudoPlayer()) Vous avez ajouté un guerrier.")
                            heroes.append(Warrior())
                  
                        case 2:
                            print("\(createPseudoPlayer()) Vous avez ajouté un colosse.")
                            heroes.append(Colossus())
              
                        case 3:
                            print("\(createPseudoPlayer()) Vous avez ajouté un nain.")
                            heroes.append(Dwarft())
          
                        case 4:
                            print("\(createPseudoPlayer()) Vous avez ajouté un magicien.")
                            heroes.append(Magician())
    
                        default:
                           return
                        }
                    }
                    namingHero() // call the function naming  heroes
            }
    
    func namingHero() { // function to name the heroes by the players
        for i in heroes {
			print("Choisissez un pseudo pour votre : \(i.descriptionClassHero)")
			var pseudoHero = ""
			repeat {
				
				if let data = readLine() {
					
					pseudoHero = data
				
				}
							
			} while pseudoHero == ""
			
                		i.nameHero = pseudoHero
                		print("Votre \(i.descriptionClassHero) s'appelle \(i.nameHero)" )
        }
    }
	
	func checkName(){
		print(".....vérification des pseudos des héros")
		for i in 0..<heroes.count {
			let hero = heroes
			
			if hero[i].nameHero == hero[i].nameHero || hero[i].nameHero != hero[i+1].nameHero || hero[i].nameHero != hero[i+2].nameHero  {
				print("Error : deux héros s'appellent de la même façon")
				print("Renommez vos héros")
				namingHero()
				
			}
		}
	}

    func statsTeams() {
        for i in 0..<heroes.count {
			
            let hero = heroes[i]
            
            if hero.lifePoints >= 1 {
            
                if hero is Magician {
                    print("\(i+1) - \(hero.nameHero), le \(hero.descriptionClassHero) possède \(hero.lifePoints) de vie et peut soigner \(hero.stuff.damage) points de vie.")
                } else if hero is Warrior || hero is Dwarft || hero is Colossus {
                    print("\(i+1) - \(hero.nameHero), le \(hero.descriptionClassHero) possède \(hero.lifePoints) de vie et une attaque de \(hero.stuff.damage) points d'attaque.")
                }
                
            } else {
                    print("\(i+1) - \(hero.nameHero), le \(hero.descriptionClassHero) est mort.")
                    }
                }
        print("==================================================================")
    }
    

    func deathTeams() -> Bool {
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

