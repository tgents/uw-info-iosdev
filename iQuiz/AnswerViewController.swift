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

    @IBOutlet weak var status: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentQuestion = questions![qIndex!] as! [String:Any]
        let text = currentQuestion["text"] as! String
        let rightAnswer = Int(currentQuestion["answer"] as! String)! - 1
        let answers = currentQuestion["answers"] as! [String]
        if answer == rightAnswer {
            score! += 1
            status.text = "Correct!\n"
        } else {
            status.text = "Incorrect :(\n"
        }
        status.text = "\(status.text!)\(text)\n"
        status.text = "\(status.text!)Answer: \(answers[rightAnswer])"
        
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
