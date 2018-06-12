//
//  Weapon.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 01/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation

// create stuff's declensions. the excalibur class inherits from the class stuff. the class defines a weapon
class Excalibur:Stuff {
    init(){
        super.init(nameWeapon: "Excalibur", damage: 10, spellPower: 0)
    }
}
