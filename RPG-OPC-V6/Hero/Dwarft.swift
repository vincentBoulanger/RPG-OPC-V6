//
//  Dwarft.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 01/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation

//the dwarft class inherits from the class hero. the class defines a dwarft
class Dwarft:Hero {
    init(name:String) {
        super.init(lifePoints: 70, stuff: ThorHammer(), nameHero: name, descriptionClassHero: "Dwarft")
    }
    
}
