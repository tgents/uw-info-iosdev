//
//  main.swift
//  SimpleCalc
//
//  Created by Thomas on 10/5/16.
//  Copyright © 2016 Thomas. All rights reserved.
//

import Foundation

print("Enter an expression separated by returns or \"exit\" to close program")

var loop: Bool = true

let arguments = CommandLine.arguments
//2 3 4 count
if arguments.count > 1 {
//    loop = false;
    print("command line arguments not ready yet...")
    exit(0)
}

while(loop){
    let input: String = readLine(strippingNewline: true)!
    let inputArr = input.components(separatedBy: " ")
    if inputArr.count > 1{
        var op2: String = inputArr[inputArr.count - 1]
        // count
        if op2 == "count"{
            print("Result:", inputArr.count - 1)
        }
        // average
        else if op2 == "avg"{
            var count: Double = 0
            for item in inputArr{
                if(Double(item) != nil){
                  count += Double(item)!
                }
            }
            print("Result:", count/Double(inputArr.count - 1))
        }
        // factorial
        else if op2 == "fact"{
            // get number
            if Int(inputArr[0]) != nil && inputArr.count == 2 {
                var num:Int = Int(inputArr[0])!
                if num == 0 { // check 0
                    print("Result:", 1)
                } else if(num < 0){ // check negative
                    print("Result:", "undefined")
                }else { // calc factorial
                    var factorial:Int = 1
                    for index in 1...num {
                        factorial *= index
                    }
                    print("Result:", factorial)
                }
            } else {
                print("Error: not a valid number")
            }
        }
        // not count, avg, or fact
        else {
            print("Error: operation not recognized")
        }
    } else {
        var num1 = input
        var op = readLine(strippingNewline: true)!
        var num2 = readLine(strippingNewline: true)!
        if Double(num1) == nil || Double(num2) == nil{ // check numbers
            print("Error: not a valid number")
        } else{
            switch op{
                case "+":
                print("Result:", (Double(num1)! + Double(num2)!))
                
                case "-":
                print("Result:", (Double(num1)! - Double(num2)!))
                
                case "*":
                print("Result:", (Double(num1)! - Double(num2)!))
                
                case "/":
                print("Result:", (Double(num1)! - Double(num2)!))
                
                case "%":
                print("Result:", (Double(num1)!.truncatingRemainder(dividingBy:Double(num2)!)))
            default:
               print("Error: operation not recognized")
            }
        }
    }
}

