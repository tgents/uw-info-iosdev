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
    
    @IBOutlet weak var goodJokeLabel: UILabel!
    @IBOutlet weak var punJokeLabel: UILabel!
    @IBOutlet weak var dadJokeLabel: UILabel!
    
    var goodJokeStatus: Bool = true;
    var punJokeStatus: Bool = true;
    var dadJokeStatus: Bool = true;
    
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
                                self.goodJokeLabel.text = "haha punchline"
                                sender.setTitle("Back", for: UIControlState.normal)
                            } else {
                                self.goodJokeLabel.text = "haha joke"
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
                self.punJokeLabel.text = "haha punchline"
                sender.setTitle("Back", for: UIControlState.normal)
            } else {
                self.punJokeLabel.text = "haha pun"
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
                self.dadJokeLabel.text = "They're hill areas."
                sender.setTitle("Back", for: UIControlState.normal)
            } else {
                self.dadJokeLabel.text = "Mountains aren't funny."
                sender.setTitle("Next", for: UIControlState.normal)
            }
            self.dadJokeStatus = !self.dadJokeStatus
            }
        )
    }

}

