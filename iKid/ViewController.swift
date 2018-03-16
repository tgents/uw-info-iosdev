//
//  ViewController.swift
//  iKid
//
//  Created by iGuest on 11/2/16.
//  Copyright © 2016 thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var goodJokeView: UIView!
    @IBOutlet var punJokeView: UIView!
    @IBOutlet var dadJokeView: UIView!
    @IBOutlet var knockKnockView: UIView!
    
    @IBOutlet weak var goodJokeLabel: UILabel!
    @IBOutlet weak var punJokeLabel: UILabel!
    @IBOutlet weak var dadJokeLabel: UILabel!
    @IBOutlet weak var knockKnockLabel: UILabel!
    
    var goodJokeStatus: Bool = true;
    var punJokeStatus: Bool = true;
    var dadJokeStatus: Bool = true;
    var knockKnockStatus: Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goodJokeNext(_ sender: UIButton) {
        goodJokeLabel.text = ""
        sender.setTitle("", for: UIControlState.normal)
        UIView.transition(with: goodJokeView, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromRight, animations: nil, completion: {(_ : Bool) -> Void in
            if(self.goodJokeStatus){
                self.goodJokeLabel.text = "Because if they fell forward, they'd still be in the boat."
                sender.setTitle("Back", for: UIControlState.normal)
            } else {
                self.goodJokeLabel.text = "Why do scuba divers fall backwards off of the boat?"
                sender.setTitle("Next", for: UIControlState.normal)
            }
            self.goodJokeStatus = !self.goodJokeStatus
            }
        )
    }
    
    @IBAction func punJokeNext(_ sender: UIButton) {
        punJokeLabel.text = ""
        sender.setTitle("", for: UIControlState.normal)
        UIView.transition(with: punJokeView, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromRight, animations: nil, completion: {(_ : Bool) -> Void in
            if(self.punJokeStatus){
                self.punJokeLabel.text = "They're hill areas."
                sender.setTitle("Back", for: UIControlState.normal)
            } else {
                self.punJokeLabel.text = "Mountains aren't funny."
                sender.setTitle("Next", for: UIControlState.normal)
            }
            self.punJokeStatus = !self.punJokeStatus
            }
        )
    }
    
    @IBAction func dadJokeNext(_ sender: UIButton) {
        dadJokeLabel.text = ""
        sender.setTitle("", for: UIControlState.normal)
        UIView.transition(with: dadJokeView, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromRight, animations: nil, completion: {(_ : Bool) -> Void in
            if(self.dadJokeStatus){
                self.dadJokeLabel.text = "history"
                sender.setTitle("Back", for: UIControlState.normal)
            } else {
                self.dadJokeLabel.text = "I can rewrite history."
                sender.setTitle("Next", for: UIControlState.normal)
            }
            self.dadJokeStatus = !self.dadJokeStatus
            }
        )
    }
    
    @IBAction func knockKnockNext(_ sender: UIButton) {
        knockKnockStatus += 1
        if(knockKnockStatus > 4){
            knockKnockStatus = 0
        }
        knockKnockLabel.text = ""
        sender.setTitle("", for: UIControlState.normal)
        UIView.transition(with: knockKnockView, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromRight, animations: nil, completion: {(_ : Bool) -> Void in
            switch self.knockKnockStatus {
            case 0:
                self.knockKnockLabel.text = "Knock Knock"
                sender.setTitle("Next", for: UIControlState.normal)
            case 1:
                self.knockKnockLabel.text = "Who's there?"
                sender.setTitle("Next", for: UIControlState.normal)
            case 2:
                self.knockKnockLabel.text = "Me"
                sender.setTitle("Next", for: UIControlState.normal)
            case 3:
                self.knockKnockLabel.text = "Me who?"
                sender.setTitle("Next", for: UIControlState.normal)
            case 4:
                self.knockKnockLabel.text = "Me-sa Jar Jar Binks!"
                sender.setTitle("Back", for: UIControlState.normal)
            default:
                self.knockKnockLabel.text = "Knock Knock"
                sender.setTitle("Next", for: UIControlState.normal)
                self.knockKnockStatus = 0
            }
            }
        )
    }

}

