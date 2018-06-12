//
//  Hero.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 01/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation

//the class hero 's creation. the class defines what a hero is
class Hero {
	
    let nameHero:String
    var lifePoints:Int
    var stuff:Stuff
    let descriptionClassHero:String
	let lifePointsMax:Int
    init(lifePoints:Int, stuff:Stuff, nameHero:String, descriptionClassHero: String) {
        self.lifePoints = lifePoints
        self.stuff = stuff
        self.nameHero = nameHero
        self.descriptionClassHero = descriptionClassHero
		self.lifePointsMax = lifePoints
    }
	
	
	//the function determines if the chosen hero is in life, if his target is in life and if it's ok. The target win the number of of attack's points
    func attack(target: Hero) {
		if lifePoints > 0 {
			if target.lifePoints <= 0 {
				print("you're not gonna hit a dead guy? Shame on you ! Next battle !")
			} else {
				target.lifePoints -= stuff.damage  // soustract lifepoints
				if target.lifePoints <= 0 {
					target.lifePoints = 0
				}
				print("\(nameHero) your \(descriptionClassHero) inflicted \(stuff.damage) damage points to \(target.nameHero) the \(target.descriptionClassHero) enemy whith his weapon \(stuff.nameWeapon).")
			}
		} else {
			print("Sorry, you can't attack. You are dead ! ")
		}
    }
}
