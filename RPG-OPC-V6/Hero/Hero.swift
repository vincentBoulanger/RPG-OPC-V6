//
//  Hero.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 01/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation

class Hero {
    var nameHero:String
    var lifePoints:Int
    var stuff:Stuff

    var descriptionClassHero:String
    
    init(lifePoints:Int, stuff:Stuff, nameHero:String, descriptionClassHero: String) {
        
        self.lifePoints = lifePoints
        self.stuff = stuff // var stuff:Stuff -> greffer une arme
        self.nameHero = nameHero
        self.descriptionClassHero = descriptionClassHero
    }
   
}
