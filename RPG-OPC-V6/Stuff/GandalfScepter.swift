//
//  GandalfScepter.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 01/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation

// create stuff's declensions.the gandalf scepter class inherits from the class stuff. the class defines a weapon
class GandalfScepter:Stuff {
    init(){
		super.init(nameWeapon: "Gandalf's Scepter", damage: 0, spellPower: 30)
    }
}
