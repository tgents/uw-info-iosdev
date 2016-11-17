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
    static let path = Bundle.main.path(forResource: "data", ofType: "txt")!
    var urlToRequest: String = "http://tednewardsandbox.site44.com/questions.json"
    var data: [[String:Any]]?
    override init() {
        super.init()
        load()
    }
    
    func load() {
        do{
            var content = NSData(contentsOf: URL(string: urlToRequest)!)
            if(content == nil){
                content = NSData(contentsOfFile: QuizData.path)
            }
            if(content != nil){
                data = try JSONSerialization.jsonObject(with: content as! Data, options: []) as! [[String:Any]]
                save(content!)
            }
            
        } catch {
            print("ERROR AAAH", error)
        }
    }
    
    func save(_ content:NSData){
        do {
            if let JSONString = String(data: content as Data, encoding: String.Encoding.utf8) {
                print(JSONString)
                try JSONString.write(toFile: QuizData.path, atomically: true, encoding: String.Encoding.utf8)
            }
        } catch {
            print(error)
        }
    }
}
