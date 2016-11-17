//
//  QuizData.swift
//  iQuiz
//
//  Created by iGuest on 11/16/16.
//  Copyright © 2016 thomas. All rights reserved.
//

import UIKit

class QuizData: NSObject {
    static let shared = QuizData()
    var data: [[String:Any]]?
    let path = Bundle.main.path(forResource: "data", ofType: "txt")!
    override init() {
        let urlToRequest: String = "http://tednewardsandbox.site44.com/question.json"
        do{
            let content = NSData(contentsOf: URL(string: urlToRequest)!)
            if(content != nil){
                data = try JSONSerialization.jsonObject(with: content as! Data, options: []) as! [[String:Any]]
//                let saveData = data as! NSArray
//                saveData.write(toFile: path, atomically: true)
            }
//            else {
//                data = NSArray(contentsOfFile:path) as! [[String : Any]]?
//            }
            
        } catch {
            print("ERROR AAAH", error)
        }
    }
}
