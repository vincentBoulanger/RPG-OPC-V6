//
//  Input.swift
//  RPG-OPC-V6
//
//  Created by VINCENT BOULANGER on 14/03/2018.
//  Copyright © 2018 VBoulanger. All rights reserved.
//

import Foundation

class Input{
    
    // ##############################  Mes inputs ##################################
    
    
    static func myInputString() -> String { // function readLine unwrapped / verified to return a String
        guard let str = readLine() else { return "" }
        return str
    }
    
    static func myInputInt() -> Int{ // function readLine unwrapped / verified and converted ti return an Integer
        guard let input = readLine() else {return 0}
        guard let inputToInt = Int(input) else {return 0}
        return inputToInt
    }
    
}
