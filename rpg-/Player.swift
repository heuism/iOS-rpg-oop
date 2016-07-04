//
//  Player.swift
//  rpg-
//
//  Created by Hien Tran on 4/07/2016.
//  Copyright © 2016 HienTran. All rights reserved.
//

import Foundation

class Player: Character {
    private var _name = "Player"
    
    var name: String {
        get {
            return _name
        }
    }
    
    private var _inventory = [String]()
    
    var inventory: [String] {
        get {
            return _inventory
        }
    }
    
    func addItemToInventory(item: String) {
        self._inventory.append(item)
    }
    
    convenience init (name: String, hp: Int, attackPwr: Int) {
        self.init(startingHP: hp, attackPwr: attackPwr)
        self._name = name
    }
    
    
}
