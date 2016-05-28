//
//  ResultController.swift
//  Roshambo
//
//  Created by Abdisalan Mohamud on 5/27/16.
//  Copyright © 2016 Abdisalan Mohamud. All rights reserved.
//

import UIKit

class ResultController: UIViewController {
    var computerMove: String!
    var playerMove: String!
    var result: String!
    
    
    @IBOutlet weak var resultMessage: UILabel!
    @IBOutlet weak var gameResult: UIImageView!
    
    override func viewWillAppear(animated: Bool) {
        
        if playerMove == computerMove {
            result = "tie"
            self.resultMessage.text = "It is a tie."
        } else if playerMove == "rock" {
            if computerMove == "scissors" {
                result = "rockWin"
                self.resultMessage.text = "You Win!"
            } else {
                result = "paperWin"
                self.resultMessage.text = "You Lost"
            }
        } else if playerMove == "paper" {
            if computerMove == "rock" {
                result = "paperWin"
                self.resultMessage.text = "You Win!"
            } else {
                result = "scissorsWin"
                self.resultMessage.text = "You Lost"
            }
        } else if playerMove == "scissors" {
            if computerMove == "paper" {
                result = "scissorsWin"
                self.resultMessage.text = "You Win!"
            } else {
                result = "rockWin"
                self.resultMessage.text = "You Lost"
            }
        }
        
        self.gameResult.image = UIImage(named: "\(result)")
        self.gameResult.alpha = 0
        self.resultMessage.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(0.3) {
            self.gameResult.alpha = 1
            self.resultMessage.alpha = 1
        }
    }
    
    @IBAction func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
