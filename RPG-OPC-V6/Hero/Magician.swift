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
        super.init(lifePoints: 80, stuff: GandalfScepter(spellPower: 30), nameHero: name, descriptionClassHero: "Sorcerer", lifePointsMax:80)
    }
    
    func heal(target: Hero) { // the mage increase life'points of a teammate
		
		var magicPower = GandalfScepter(spellPower: 30)
		
		print("Your \(target.descriptionClassHero) has been healed by your \(descriptionClassHero) for \(magicPower.spellPower) of life.")
		
		if target.lifePoints <= 0 {
			
			target.lifePoints = 0
			
			magicPower = GandalfScepter(spellPower: 0)
	
			print("You can't resuscitate a hero. Your spell has failed.")
			return
		}
		
		target.lifePoints += magicPower.spellPower // Add 30 lifepoints to the target
		
		if target.lifePoints > target.lifePointsMax { // after a heal the heroes can't have more lifepoints than
			
			target.lifePoints = target.lifePointsMax
			
			print("This hero has all his life points.")
			
		}
		
    }
   
}
