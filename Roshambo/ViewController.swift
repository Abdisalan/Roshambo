//
//  RoshamboController.swift
//  Roshambo
//
//  Created by Abdisalan Mohamud on 5/27/16.
//  Copyright © 2016 Abdisalan Mohamud. All rights reserved.
//

import UIKit

class RoshamboController: UIViewController {
    
    var move: String!
    
    func computersMove() -> String {
        let move = arc4random() % 3
        switch move {
        case 0:
            return "rock"
        case 1:
            return "paper"
        case 2:
            return "scissors"
        default:
            return "something messed up"
        }
    }
    
    //CODE ONLY
    @IBAction func rockMove() {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultController") as! ResultController
        
        controller.computerMove = self.computersMove()
        controller.playerMove = "rock"
        print("rock played")
        
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    //CODE AND STORYBOARD
    @IBAction func paperMove() {
        move = "paper"
        performSegueWithIdentifier("play", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! ResultController
        controller.playerMove = move
        controller.computerMove = computersMove()
        print("paper played")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

