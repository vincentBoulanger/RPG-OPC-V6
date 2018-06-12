//
//  Magician.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 01/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation

//the magician class inherits from the class hero. the class defines a magician
class Magician:Hero {
	
    init(name:String) {
        super.init(lifePoints: 80, stuff: GandalfScepter(), nameHero: name, descriptionClassHero: "Sorcerer")
    }
	
	// the function determines if the chosen hero is in life, if his target is in life and if it's ok. The target win the number of heal's points.
    func heal(target: Hero) { // the mage increase life'points of a teammate
		if lifePoints > 0 {
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
	
	// function to cancel the attack 's magician
	override func attack(target: Hero) {
		print("Sorry i can't attack i am a mage")
	}
	
}
