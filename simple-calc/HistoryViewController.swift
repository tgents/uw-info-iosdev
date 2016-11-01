//
//  HistoryViewController.swift
//  simple-calc
//
//  Created by iGuest on 10/31/16.
//  Copyright © 2016 Thomas. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    
    var data: [String] = []

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(data)
        for index in 0..<data.count {
            let label = UILabel(frame: CGRect(x: 0, y: index * 30, width: Int(scrollView.bounds.size.width), height: 21))
            label.textAlignment = .right
            label.text = data[index]
            scrollView.addSubview(label)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondViewController = segue.destination as! ViewController
        secondViewController.history = data
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
