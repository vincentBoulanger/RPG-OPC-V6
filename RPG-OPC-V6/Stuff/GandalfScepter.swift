//
//  GandalfScepter.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 01/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation

class GandalfScepter:Stuff { // create stuff's declensions
    let spellPower:Int
    init(spellPower:Int){
        self.spellPower = spellPower
        super.init(nameWeapon: "Le sceptre de Gandalf", damage: 30)
    }
}
