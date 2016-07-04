//
//  Character.swift
//  rpg-
//
//  Created by Hien Tran on 4/07/2016.
//  Copyright © 2016 HienTran. All rights reserved.
//

import Foundation

class Character {
    private var _hp: Int = 100
    private var _attackPwr: Int = 10
    
    var hp: Int {
        get {
            return _hp
        }
//        set {
//            _hp = newValue
//        }
    }
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
//        set {
//            _attackPwr = newValue
//        }
    }
    
    init(startingHP: Int, attackPwr: Int) {
        self._hp = startingHP
        self._attackPwr = attackPwr
    }
    
    var isAlive: Bool {
        get{
            if hp <= 0 {
                return false
            }
                return true
        }
    }
    
    
    func attemptAttack(attackPwr: Int) -> Bool {
        self._hp -= attackPwr
        
        return true
    }
}
