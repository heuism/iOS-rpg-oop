//
//  ViewController.swift
//  rpg-oop
//
//  Created by Hien Tran on 4/07/2016.
//  Copyright © 2016 HienTran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myTimer: Timer = Timer()
    
    
    @IBOutlet weak var printLbl: UILabel!
    @IBOutlet weak var playerHPLbl: UILabel!
    @IBOutlet weak var enemyHPLbl: UILabel!
    @IBOutlet weak var enemyImg: UIImageView!
    @IBOutlet weak var attackTap: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    @IBOutlet weak var chestBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        player = Player(name: "HienTran2005", hp: 110, attackPwr: 20)
        //playerHPLbl.text = "\(player.hp)"
        displayPlayerHP()
        generateRandomEnemy()
        chestBtn.isHidden = true
    }
    
    func enemyAttack() {
        printLbl.text = "attacked by \(enemy.type)"
        player.attemptAttack(attackPwr: enemy.attackPwr)
        displayPlayerHP()
        if !player.isAlive {
            playerHPLbl.text = ""
            printLbl.text = "Got killed by \(enemy.type)"
            myTimer.invalidate()
        }
    }
    
    @IBAction func onAttackTap(_ sender: AnyObject) {
        if enemy.attemptAttack(attackPwr: player.attackPwr) {
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            displayEnemyHP()
        }
        else{
            printLbl.text = "Attack was unsuccessful "
        }
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(item: loot)
            chestMessage = "\(player.name) found a loot \(loot)"
            chestBtn.isHidden = false
        }
        if !enemy.isAlive {
            //enemyHPLbl.text = ""
            myTimer.invalidate()
            displayEnemyHP()
            printLbl.text = "Killed  \(enemy.type)"
            enemyImg.isHidden = true
            attackTap.isEnabled = false
        }
    }
    
    @IBAction func onChestTap(_ sender: AnyObject) {
        chestBtn.isHidden = true
        if let _ = chestMessage {
            printLbl.text = chestMessage
        }
        //        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ViewController.generateRandomEnemy), userInfo: nil, repeats: false)
        var myTimer2 = generateTimer(function: "generateRandomEnemy", repeated: false)
    }
    
    func generateRandomEnemy() {
        attackTap.isEnabled = true
        myTimer = generateTimer(function: "enemyAttack", repeated: true)
        let rand = Int(arc4random_uniform(UInt32(2)))
        
        if rand == 0 {
            enemy = Kimera(startingHP: 50, attackPwr: 12)
        }
        else {
            enemy = DevilWizard(startingHP: 60, attackPwr: 15)
        }
        enemyImg.isHidden = false
        displayEnemyHP()
    }
    
    func displayEnemyHP() {
        if enemy.hp <= 0 {
            enemyHPLbl.text = ""
        } else {
            enemyHPLbl.text = "\(enemy.hp) HP"

        }
    }
    
    func displayPlayerHP() {
        if player.hp <= 0 {
            playerHPLbl.text = ""
        }
        else {
            playerHPLbl.text = "\(player.hp) HP"
        }
    }

    func generateTimer(function: String, repeated: Bool) -> Timer {
        return Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: Selector(function), userInfo: nil, repeats: repeated)
    }
}

