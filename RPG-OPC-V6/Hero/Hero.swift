//
//  Hero.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 01/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation

class Hero {
    
    var lifePoints:Int
    var attackPointsHero:Int
    var healHeroPoints:Int
    var descriptionClassHero:String
    
    init(lifePoints:Int, attackPointsHero:Int, healHeroPoints: Int, descriptionClassHero: String) {
        
        self.lifePoints = lifePoints
        self.attackPointsHero = attackPointsHero
        self.healHeroPoints = healHeroPoints
        self.descriptionClassHero = descriptionClassHero
    }
    func attackHero() {
        
    }
    func healHero() {
        
    }
    func deathHero()  {
        
    }
    func choseHeroEnenmy() {
        
    }
    
}
