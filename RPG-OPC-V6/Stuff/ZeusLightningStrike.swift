//
//  ZeusLightningStrike.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 01/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation

// create stuff's declensions. the ZeusLightningStrike class inherits from the class stuff. the class defines a weapon
class ZeusLightningStrike:Stuff {
    init() {
        super.init(nameWeapon: "The Zeus's lightning Strike", damage: 5, spellPower: 0)
    }
}
