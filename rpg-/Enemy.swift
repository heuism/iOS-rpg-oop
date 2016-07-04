//
//  Enemy.swift
//  rpg-
//
//  Created by Hien Tran on 4/07/2016.
//  Copyright © 2016 HienTran. All rights reserved.
//

import Foundation

class Enemy: Character {
    var loot: [String] {
        get{
            return ["Rusty Dagger", "Cracked Buckler"]
        }
    }
    
    var type: String {
        get{
            return "Grunt"
        }
    }
    
    func dropLoot() -> String? {
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        return nil
    }
    
}
