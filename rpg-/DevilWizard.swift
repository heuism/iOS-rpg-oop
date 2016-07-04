//
//  DevilWizard.swift
//  rpg-
//
//  Created by Hien Tran on 4/07/2016.
//  Copyright © 2016 HienTran. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
}
