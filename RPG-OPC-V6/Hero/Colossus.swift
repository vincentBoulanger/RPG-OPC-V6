//
//  Colossus.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 01/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation

class Colossus:Hero { //the Colossus class inherits from the class hero
    init() {
        super.init(lifePoints: 150, stuff: ZeusLightningStrike(), nameHero:"Colosse sans nom", descriptionClassHero: "COLOSSE")
    }
}
