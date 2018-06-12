//
//  CheckNames.swift
//  RPG-OPC-V6
//
//  Created by Vincent Boulanger on 30/04/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation

// class with singleton to check the name of heroes. a player can't chose the same name of other pseudo
class CheckNames {
    private var nameHeroes = [String]()
    static let shared = CheckNames() // launch singleton
	private init() {}
	
	// determine if there are not two identical aliases
   func uniqueHeroName() -> String {
        var heroName = ""
        repeat {
            print("Choose a pseudo to your hero : ")
            if let data = readLine() { // input selection hero's name
                heroName = data
                if nameHeroes.contains(heroName) { // pseudo presence test
					print("")
                    print("This pseudo : ' \(heroName)' has been used. Please try again :")
                    heroName = ""
                } else {
                    nameHeroes.append(heroName) // if the pseudo does not existed. the pseudo 's added to the array nameHeroes
                    print("This nickname does not exist you can continue. ")
                }
            }
        } while heroName == ""
        return heroName
    }
}
