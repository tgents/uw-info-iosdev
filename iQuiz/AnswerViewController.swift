//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/9/16.
//  Copyright © 2016 thomas. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    var questions: [Any]?
    var answer: Int?
    var qIndex: Int?
    var score: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func next(_ sender: UIBarButtonItem) {
        if(qIndex == questions!.count - 1){
            performSegue(withIdentifier: "toResult", sender: self)
        } else {
            performSegue(withIdentifier: "toQuestion", sender: self)
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult" {
            let other = segue.destination as! ResultViewController
            other.score = score
            other.questions = questions
        } else if segue.identifier == "toQuestion" {
            let other = segue.destination as! QuestionViewController
            other.score = score
            other.questions = questions
            other.qIndex = qIndex! + 1
        }
    }

}
