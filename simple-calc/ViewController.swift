//
//  ViewController.swift
//  simple-calc
//
//  Created by iGuest on 10/24/16.
//  Copyright © 2016 Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var equationField: UILabel!
    @IBOutlet weak var valueField: UILabel!
    
    var nums = [Double]()
    var operation : String = ""
    
    var canEnterOp: Bool = false
    var history: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valueField.adjustsFontSizeToFitWidth = true
        equationField.adjustsFontSizeToFitWidth = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clear(_ sender: UIButton) {
        clearAll()
        valueField.text = ""
        equationField.text = ""
    }
    
    @IBAction func numClick(_ sender: UIButton) {
        let num = sender.titleLabel!.text!
        if(canEnterOp){
            if(num != "." || (num == "." && !valueField.text!.contains("."))){
                valueField.text = "\(valueField.text!)\(num)"
            }
        } else {
            equationField.text = ""
            valueField.text = "\(num)"
        }
        canEnterOp = true
    }

    @IBAction func operationClick(_ sender: UIButton) {
        if(canEnterOp){
            canEnterOp = false
            let op = sender.titleLabel!.text!
            nums.append(Double(valueField.text!)!)
            valueField.text = ""
            operation = op
        }
    }
    
    @IBAction func equalsClick(_ sender: UIButton) {
        if(Int(valueField.text!) != nil){
            nums.append(Double(valueField.text!)!)
        }
        print(String(describing: nums))
        if nums.count >= 2 && operation != "" {
            switch operation{
            case "+":
                equationField.text = "\(nums[0]) + \(nums[1])"
                valueField.text = String(nums[0] + nums[1])
            case "-":
                equationField.text = "\(nums[0]) - \(nums[1])"
                valueField.text = String(nums[0] - nums[1])
            case "x":
                equationField.text = "\(nums[0]) x \(nums[1])"
                valueField.text = String(nums[0] * nums[1])
            case "÷":
                equationField.text = "\(nums[0]) ÷ \(nums[1])"
                valueField.text = String(Double(nums[0]) / Double(nums[1]))
            case "%":
                equationField.text = "\(nums[0]) % \(nums[1])"
                valueField.text = String(nums[0].truncatingRemainder(dividingBy: nums[1]))
            case "COUNT":
                equationField.text = "COUNT\(nums)"
                valueField.text = String(nums.count)
            case "AVG":
                var count: Double = 0
                for item in nums{
                    count += Double(item)
                }
                equationField.text = "AVG\(nums)"
                valueField.text = String(count/Double(nums.count))
            default:
                valueField.text = String(nums[1])
            }
            history.append(equationField.text! + " = " + valueField.text!)
            clearAll()
        } else if operation == "!" {
            var factorial:Int = 1
            for index in 1...Int(nums[0]) {
                factorial *= index
            }
            equationField.text = "\(nums[0])!"
            valueField.text = String(factorial)
            history.append(equationField.text! + " = " + valueField.text!)
            clearAll()
        }
    }

    func clearAll(){
        canEnterOp = false
        operation = ""
        nums = [Double]()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondViewController = segue.destination as! HistoryViewController
        secondViewController.data = history
    }
}

