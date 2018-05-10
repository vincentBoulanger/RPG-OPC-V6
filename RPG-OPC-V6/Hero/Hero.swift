//
//  Hero.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 01/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation

class Hero { //the class hero 's creation 
	
    var nameHero:String
    var lifePoints:Int
    var stuff:Stuff
    var descriptionClassHero:String
	var lifePointsMax:Int
	
    init(lifePoints:Int, stuff:Stuff, nameHero:String, descriptionClassHero: String) {
        
        self.lifePoints = lifePoints
        self.stuff = stuff
        self.nameHero = nameHero
        self.descriptionClassHero = descriptionClassHero
		self.lifePointsMax = lifePoints
    }
    
    func attack(target: Hero) {  // the function chose a hero and soustract lifepoints
		
       // soustract lifepoints
		if lifePoints > 0 {
			if target.lifePoints <= 0 {
				
				print("The dead do not attack.")
				
			} else {
				
				target.lifePoints -= stuff.damage
				
				if target.lifePoints <= 0 {
					target.lifePoints = 0
				}
				
				print("\(nameHero) your \(descriptionClassHero) inflicted \(stuff.damage) damage points to \(target.nameHero) the \(target.descriptionClassHero) enemy whith his weapon \(stuff.nameWeapon).")
			}
		} else {
			print("Sorry, you can't attack.")
		}
		
    }

}
