//
//  Warrior.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 01/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation

class Warrior:Hero {
    init() {
        super.init(lifePoints: 100, stuff: Excalibur(),  descriptionClassHero: "GUERRIER")
        
        //super.attackHero()
    }
}
