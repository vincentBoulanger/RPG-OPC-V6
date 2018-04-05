//
//  Magician.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 01/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation

class Magician:Hero {
   
    init() {
        super.init(lifePoints: 70, stuff: GandalfScepter(spellPower: 100), nameHero:"Magicien sans nom", descriptionClassHero: "MAGICIEN")
    }
    
    func heal(target: Hero) {
        target.lifePoints += stuff.damage
        print(nameHero + " soigne " + target.nameHero + " pour \(stuff.damage) dégâts. "  )
    }
}
