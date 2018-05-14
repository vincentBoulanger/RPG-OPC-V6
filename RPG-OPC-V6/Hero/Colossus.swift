//
//  Colossus.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 01/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation

//the colossus class inherits from the class hero. the class defines a colossus
class Colossus:Hero {
    init(name:String) {
        super.init(lifePoints: 150, stuff: ZeusLightningStrike(), nameHero: name, descriptionClassHero: "Colossus")
    }
}
