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
        super.init(lifePoints: 80, stuff: GandalfScepter(), nameHero:"Magicien sans nom",descriptionClassHero: "MAGICIEN")
    }
    func healHero() -> Bool {
        
        // vie de machin + 20
        if deathHero() == false {
            print("Le Druide soigne :")
        }
        return true
    }
}
