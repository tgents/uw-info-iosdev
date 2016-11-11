//
//  ResultViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/9/16.
//  Copyright © 2016 thomas. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var questions: [Any]?
    var score: Int?

    @IBOutlet weak var result: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if score == questions!.count {
            result.text = "Perfect!\n\(score!)/\(questions!.count)"
        } else if score! > questions!.count/2{
            result.text = "Looking good!\n\(score!)/\(questions!.count)"
        } else{
            result.text = "You can do better!\n\(score!)/\(questions!.count)"
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
