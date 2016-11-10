//
//  QuizViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/9/16.
//  Copyright © 2016 thomas. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var questions: [String: Any]?
    var qIndex: Int?
    var score: Int?

    @IBOutlet var Answers: [UIButton]!
    @IBOutlet weak var Question: UILabel!
    
    var selectedButton: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let other = segue.destination as! AnswerViewController
        other.score = score
        other.questions = questions
        other.answer = selectedButton
        other.qIndex = qIndex
    }


}
