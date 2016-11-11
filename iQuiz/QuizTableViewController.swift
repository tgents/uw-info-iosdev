//
//  QuizTableViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/4/16.
//  Copyright © 2016 thomas. All rights reserved.
//

import UIKit

class QuizTableViewController: UITableViewController {
    
    let questions =
        ["Mathematics":
            ["description":"stuff about math",
             "icon": "mathicon",
             "questions":
                [
                    [
                    "text":"What is fire?",
                    "answer":"1",
                    "answers":
                        [
                            "One of the four classical elements",
                            "A magical reaction given to us by God",
                            "A band that hasn't yet been discovered",
                            "Fire! Fire! Fire! heh-heh"
                        ]
                    ],
                    [
                        "text":"What is ATP?",
                        "answer":"4",
                        "answers":
                            [
                                "One of thos Jeep things",
                                "A magical reaction given to us by God",
                                "A band that hasn't yet been discovered",
                                "Adenosine triphosphate"
                        ]
                    ]
                ],
            ],
         "Marvel Super Heroes":
            ["description":"super heros from Marvel",
             "icon": "marvelicon",
             "questions":
                [
                    [
                        "text":"Who is Iron Man?",
                        "answer":"1",
                        "answers":
                            [
                                "Tony Stark",
                                "Obadiah Stane",
                                "A rock hit by Megadeth",
                                "Nobody knows"
                        ]
                    ],
                    [
                        "text":"Who founded the X-Men?",
                        "answer":"2",
                        "answers":
                            [
                                "Tony Stark",
                                "Professor X",
                                "The X-Institute",
                                "Erik Lensherr"
                        ]
                    ]
                ],
            ],
         "Science":
            ["description":"science!",
             "icon": "scienceicon",
             "questions":
                [
                    [
                        "text":"What is 2 + 2?",
                        "answer":"1",
                        "answers":
                            [
                                "4",
                                "22",
                                "An irrational number",
                                "Nobody knows"
                        ]
                    ],
                    [
                        "text":"What is 10 ÷ 5?",
                        "answer":"2",
                        "answers":
                            [
                                "4",
                                "2",
                                "An irrational number",
                                "Nobody knows"
                        ]
                    ]
                ],
            ]
    ]
    
    var selectedQuestions:[Any]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
    
    @IBAction func settingAction(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell", for: indexPath) as! QuizTableViewCell
        let key = Array(questions.keys)[indexPath.row]
        let dictionary = questions[key]! as [String:Any]
        cell.titleLabel.text = key
        cell.descriptionLabel.text = dictionary["description"] as! String
        cell.picture.image = UIImage(named: dictionary["icon"] as! String)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let key = Array(questions.keys)[indexPath.row]
        let dictionary = questions[key]! as [String:Any]
        selectedQuestions = dictionary["questions"] as! [Any]
        performSegue(withIdentifier: "toQuestion", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let other = segue.destination as! QuestionViewController
        other.questions = selectedQuestions
        other.qIndex = 0
        other.score = 0
    }
 

}
