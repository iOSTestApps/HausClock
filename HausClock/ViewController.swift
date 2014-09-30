//
//  ViewController.swift
//  HausClock
//
//  Created by Tom Brown on 7/13/14.
//  Copyright (c) 2014 not. All rights reserved.
//

import UIKit

enum Player {
    case Top
    case Bottom
}

enum GameState {
    case Active
    case Paused
}


class ViewController: UIViewController {
    
    let blackColor = UIColor.blackColor()
    let whiteColor = UIColor.whiteColor()
    let blueColor = "#91c4c5".UIColor
    
    var topSecondsRemaining = 600
    var bottomSecondsRemaining = 600
    
    var activePlayer = Player.Bottom
    var gameState = GameState.Paused
    
    @IBOutlet var topButton: UIButton!
    @IBOutlet var bottomButton: UIButton!
    
    @IBOutlet var topLabel: UILabel!
    @IBOutlet var bottomLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("onClockTick"), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func touchPauseButton(sender: UIButton) {

    }
    
    @IBAction func touchTopButton(sender: UIButton) {
        setPlayerToActive(.Bottom)
    }
    
    @IBAction func touchBottomButton(sender: UIButton) {
        setPlayerToActive(.Top)
    }
    
    func setPlayerToActive(player: Player) {
        activePlayer = player
        switch activePlayer {
        case .Top:
            topButton.backgroundColor = blueColor
            bottomButton.backgroundColor = blackColor
            topLabel.textColor = blackColor
            bottomLabel.textColor = whiteColor
            
        case .Bottom:
            topButton.backgroundColor = blackColor
            bottomButton.backgroundColor = blueColor
            bottomLabel.textColor = blackColor
            topLabel.textColor = whiteColor

        }
    }
    
    func onClockTick() {
        switch activePlayer {
        case .Top:
            topSecondsRemaining -= 1
        case .Bottom:
            bottomSecondsRemaining -= 1
        }

        topLabel.text = secondsToString(topSecondsRemaining)
        bottomLabel.text = secondsToString(bottomSecondsRemaining)
    }

    func secondsToString(seconds: Int) -> String {
        return "\(seconds/60):\(seconds % 60)"
    }
    
}

