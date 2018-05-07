//
//  Warrior.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 01/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation

class Warrior:Hero { //the warrior class inherits from the class hero
	init(name:String) {
        super.init(lifePoints: 100, stuff: Excalibur(), nameHero: name,  descriptionClassHero: "Warrior", lifePointsMax:100)
    }
   
}
