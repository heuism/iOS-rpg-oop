//
//  Kimera.swift
//  rpg-
//
//  Created by Hien Tran on 4/07/2016.
//  Copyright © 2016 HienTran. All rights reserved.
//

import Foundation

class Kimera: Enemy {
    
    let IMMNU_MAX = 15
    
    override var loot: [String] {
        return ["Tough Hide", "Kimera Venom", "Rare Trident"]
    }
    
    override var type: String {
        return "Kimera"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMMNU_MAX {
            return super.attemptAttack(attackPwr: attackPwr)
        }
        return false
    }
}
