//
//  Magician.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 01/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation

class Magician:Hero { //the magician class inherits from the class hero
	
    init(name:String) {
        super.init(lifePoints: 80, stuff: GandalfScepter(), nameHero: name, descriptionClassHero: "Sorcerer")
    }
	
	
    func heal(target: Hero) { // the mage increase life'points of a teammate
		
		
		if lifePoints < 0 {
			
			if target.lifePoints <= 0 {
				
				print("You can't resuscitate a hero. Your spell has failed.")
			} else {
				
				target.lifePoints += stuff.spellPower  // Add 30 lifepoints to the target
				
				if target.lifePoints >= target.lifePointsMax { // after a heal the heroes can't have more lifepoints than
					
					target.lifePoints = target.lifePointsMax
					
					print("Your \(target.descriptionClassHero) has all his life points.")
					
				}
				
				print("Your \(target.descriptionClassHero) has been healed by your \(descriptionClassHero) for \(stuff.spellPower) of life.") // spell's effects display
				
			}
			
		} else {
			
			print("i'am dead, i can't heal.")
		}
		
		
    }
   
}
