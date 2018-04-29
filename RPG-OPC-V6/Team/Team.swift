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
		print("1 - Guerrier - Vie: 100 - Attaque: 10")
		print("2 - Colosse  - Vie: 150 - Attaque: 5 ")
		print("3 - Nain     - Vie: 130 - Attaque: 30 ")
		print("4 - Magicien - Vie: 80  - Soins  : 20")
		print("==============================================================")
		print("Choisissez un héros en tapant un chiffre entre 1 et 4 ========")
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
			let heroName = uniqueHeroName()
			
			
				switch userChoiceTeam { // the player's choices are compared with the prpposition's game
                        
                        case 1:
                            print("Vous avez ajouté un guerrier.")
							heroes.append(Warrior(name:heroName))
					
                        case 2:
                            print("Vous avez ajouté un colosse.")
                            heroes.append(Colossus(name:heroName))
					
                        case 3:
                            print("Vous avez ajouté un nain.")
							heroes.append(Dwarft(name:heroName))
                        case 4:
                            print("Vous avez ajouté un magicien.")
                            heroes.append(Magician(name:heroName))
                        default:
                           return
                        }
                    }
		

            } // end func createHeroes
	
	func uniqueHeroName() -> String {
		var heroName = ""
		repeat {
			
			print("heroName :")  // call the function describe Hero display
			// input selection hero's player
			
			if let data = readLine() {
				heroName = data
				if nameHeroes.contains(heroName) {
					print("Le sspeudo est deja utilisé")
					heroName = ""
					
				} else {
					nameHeroes.append(heroName)
				}
			}
		} while heroName == ""
		return heroName
	}
	
	
//	    func namingHero() { // function to name the heroes by the players
//
//					var pseudoHero = ""
//					repeat {
//						print("Choisissez un pseudo pour votre héro :")
//						if let data = readLine() {
//
//
//								 if !nameHeroes.contains(pseudoHero) {
//									for i in 0..<heroes.count {
//										let hero = heroes
//
//										pseudoHero = data
//										hero[i].nameHero = pseudoHero
//										nameHeroes.append(pseudoHero)
//										print("Votre héro s'appellera désormais \(hero[i].nameHero)")
//
//										return
//									}
//
//								} else {
//
//									repeat {
//
//										print("Vous ne pouvez pas avoir d'homonymes, veuillez recommencer.")
//										namingHero()
//
//										} while self.nameHeroes.contains(pseudoHero)
//
//								}
//						}
//
//					} while pseudoHero == ""
//
//	    	} // end func naming Hero
	
	
	
	
			//for i in heroes {
				//				print("Choisissez un pseudo pour votre : \(i.descriptionClassHero)")
				//				var pseudoHero = ""
				//				repeat {
				//					if let data = readLine() {
				//						pseudoHero = data
				//					}
				//
				//				} while pseudoHero == ""
				//						i.nameHero = pseudoHero
				//						print("Votre \(i.descriptionClassHero) s'appelle \(i.nameHero)" )
				//			}
		//}
	
 // end func naming Hero
//	let hadError = lastThreeResponses.contains { element in
//		if case .error = element {
//			return true
//		} else {
//			return false
//		}
	
//	for i in 1..<nameHeroes.count {
//	print("\(nameHeroes)")
//	if nameHeroes.contains(pseudoHero) {
//
//	print("Vous ne pouvez saisir deux pseudonymes identiques.")
//
//	} else {
//
//	return
//	}
//	}
//    func namingHero() { // function to name the heroes by the players
//			for i in heroes {
//				print("Choisissez un pseudo pour votre : \(i.descriptionClassHero)")
//				var pseudoHero = ""
//				repeat {
//					if let data = readLine() {
//						pseudoHero = data
//					}
//
//				} while pseudoHero == ""
//						i.nameHero = pseudoHero
//						print("Votre \(i.descriptionClassHero) s'appelle \(i.nameHero)" )
//			}
//			checkName()
//    	} // end func naming Hero
	

//	func checkName(){
//			print(".....vérification des pseudos des héros")
//			for i in 0..<heroes.count {
//				let hero = heroes
//				if hero[i].nameHero.contains(hero[i+1].nameHero) {
//					print("test")
//				}
//				var checkNameIsOk:Bool = false
//
//				print(".....vérification des pseudos des héros... EN COURS")
//				repeat {
//					for i in 0..<heroes.count {
//
//						let hero = heroes
//
//						if hero[i].nameHero == hero[i+1].nameHero || hero[i].nameHero == hero[i+2].nameHero {
//							print("Vous ne pouvez pas posséder plusieurs héros avec un pseudo identique.")
//
//							namingHero()
//							checkNameIsOk = false
//							return
//						} else {
//							print(".....vérification des pseudos des héros...OK")
//							checkNameIsOk = true
//							return
//						}
//					}
//				} while checkNameIsOk == true
//			}
//		} // end's func checkName
	
    func statsTeams() { // different text are displaying if the hero heal or attack or is dead
		
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
		} // end func StatsTeams
	
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

