//
//  QuizTableViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/4/16.
//  Copyright © 2016 thomas. All rights reserved.
//

import UIKit

class QuizTableViewController: UITableViewController {
    
    var questions:[[String:Any]]?
    
    var selectedQuestions:[Any]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(QuizData.shared.data != nil){
            questions = QuizData.shared.data!
        } else {
            questions = [[String:Any]]()
        }
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
        return questions!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell", for: indexPath) as! QuizTableViewCell
        
        let dictionary = questions![indexPath.row] as [String:Any]
        cell.titleLabel.text = dictionary["title"] as! String
        cell.descriptionLabel.text = dictionary["desc"] as! String
        cell.picture.image = UIImage(named: "quizicon")

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! QuizTableViewCell
        let key = cell.titleLabel.text!
        print(key)
        let dictionary = questions![indexPath.row] as [String:Any]
        print(dictionary["questions"])
        selectedQuestions = dictionary["questions"] as! [[String:Any]]
        performSegue(withIdentifier: "toQuestion", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let other = segue.destination as! QuestionViewController
        other.questions = selectedQuestions
        other.qIndex = 0
        other.score = 0
    }
 

}
