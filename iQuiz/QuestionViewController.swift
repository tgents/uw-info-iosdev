//
//  QuizViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/9/16.
//  Copyright © 2016 thomas. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var questions: [Any]?
    var qIndex: Int?
    var score: Int?

    @IBOutlet var Answers: [UIButton]!
    @IBOutlet weak var Question: UILabel!
    
    var selectedButton: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentQuestion = questions![qIndex!] as! [String:Any]
        let text = currentQuestion["text"] as! String
        let answers = currentQuestion["answers"] as! [String]
        Question.text = text
        for index in 0..<Answers.count {
            Answers[index].setTitle(answers[index], for: .normal)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func next(_ sender: UIBarButtonItem) {
        if(selectedButton != -1){
            performSegue(withIdentifier: "toAnswer", sender: self)
        }
    }
    
    @IBAction func answerselect(_ sender: UIButton) {
        sender.backgroundColor = UIColor.blue
        if selectedButton != -1{
            Answers[selectedButton].backgroundColor = UIColor.white
        }
        selectedButton = Answers.index(of: sender)!
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAnswer" {
            let other = segue.destination as! AnswerViewController
            other.score = score
            other.questions = questions
            other.answer = selectedButton
            other.qIndex = qIndex
        }
        
    }


}
