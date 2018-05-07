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
	
    init(lifePoints:Int, stuff:Stuff, nameHero:String, descriptionClassHero: String, lifePointsMax:Int) {
        
        self.lifePoints = lifePoints
        self.stuff = stuff
        self.nameHero = nameHero
        self.descriptionClassHero = descriptionClassHero
		self.lifePointsMax = lifePointsMax
    }
    
    func attack(target: Hero) {  // the function chose a hero and soustract lifepoints
		
       // soustract lifepoints
		
        if target.lifePoints <= 0 {
            target.lifePoints = 0
			target.stuff.damage  = 0
			
			print("The dead do not attack ")
			return
			
		} else {
			
			target.lifePoints -= stuff.damage
			
			print("\(nameHero) your \(descriptionClassHero) inflicted \(stuff.damage) damage points to \(target.nameHero) the \(target.descriptionClassHero) enemy whith his weapon \(stuff.nameWeapon).")
		}
    }

}
