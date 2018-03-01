//
//  Weapon.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 01/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation

class Weapon:Stuff {
    var nameWeapon:String
    var degats:Int
    var amelio:Int
    
    
    init(nameWeapon:String, degats:Int, amelio:Int) {
        self.nameWeapon = nameWeapon
        self.degats = degats
        self.amelio = amelio
        
    }
    
}
