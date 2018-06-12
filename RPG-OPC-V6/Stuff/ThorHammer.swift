//
//  ThorHammer.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 01/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation

// create stuff's declensions. the dwarft class inherits from the class stuff. the class defines a weapon
class ThorHammer:Stuff {
    init(){
		super.init(nameWeapon: "Thor's Hammer", damage: 30, spellPower: 0)
    }
    
}
