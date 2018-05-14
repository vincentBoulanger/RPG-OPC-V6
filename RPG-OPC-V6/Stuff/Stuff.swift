//
//  Stuff.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 01/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation

 // create stuff's parameters. the class defines what a stuff is
class Stuff {
    var nameWeapon:String
    var damage: Int
	var spellPower: Int
	init(nameWeapon:String, damage:Int, spellPower: Int) {
        self.nameWeapon = nameWeapon
        self.damage = damage
		self.spellPower = spellPower
    }
    
}
