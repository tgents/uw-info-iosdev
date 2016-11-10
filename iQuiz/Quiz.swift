//
//  QuizData.swift
//  iQuiz
//
//  Created by iGuest on 11/9/16.
//  Copyright © 2016 thomas. All rights reserved.
//

import UIKit

class Quiz: NSObject {
    
    static let instance = Quiz()
    let data =
        [
            [
                "title":"Science!",
                "desc":"Because SCIENCE!",
                "icon": "scienceicon",
                "questions":[
                    [
                        "text":"What is fire?",
                        "answer":"1",
                        "answers":[
                            "One of the four classical elements",
                            "A magical reaction given to us by God",
                            "A band that hasn't yet been discovered",
                            "Fire! Fire! Fire! heh-heh"
                        ]
                    ],
                    [
                        "text":"What is ATP?",
                        "answer":"1",
                        "answers":[
                            "One of thos Jeep things",
                            "A magical reaction given to us by God",
                            "A band that hasn't yet been discovered",
                            "Adenosine triphosphate "
                        ]
                    ]
                ]
            ],
            [
                "title":"Marvel Super Heroes",
                "desc": "Avengers, Assemble!",
                "icon": "marvelicon",
                "questions":[
                    [
                        "text":"Who is Iron Man?",
                        "answer":"1",
                        "answers":[
                            "Tony Stark",
                            "Obadiah Stane",
                            "A rock hit by Megadeth",
                            "Nobody knows"
                        ]
                    ],
                    [
                        "text":"Who founded the X-Men?",
                        "answer":"2",
                        "answers":[
                            "Tony Stark",
                            "Professor X",
                            "The X-Institute",
                            "Erik Lensherr"
                        ]
                    ],
                    [
                        "text":"How did Spider-Man get his powers?",
                        "answer":"1",
                        "answers":[
                            "He was bitten by a radioactive spider",
                            "He ate a radioactive spider",
                            "He is a radioactive spider",
                            "He looked at a radioactive spider"
                        ]
                    ]
                ]
            ],
            [
                "title":"Mathematics",
                "desc":"Did you pass the third grade?",
                "icon": "mathicon",
                "questions":[
                    [
                        "text":"What is 2 + 2?",
                        "answer":"1",
                        "answers":[
                            "4",
                            "22",
                            "An irrational number",
                            "Nobody knows"
                        ]
                    ],
                    [
                        "text":"What is 10 ÷ 5?",
                        "answer":"2",
                        "answers":[
                            "4",
                            "2",
                            "An irrational number",
                            "Nobody knows"
                        ]
                    ]
                ]
            ]
    ]
//    var data: [String:AnyObject]?
//    
//    override init() {
//        
//            let path = Bundle.main.path(forResource: "questions", ofType: "json")
//            
//            //reading
//            do {
//                let text = try String(contentsOfFile: path!)
//                data = Quiz.convertStringToDictionary(text)
//            }
//            catch {/* error handling here */}
//        
//    }
//    
//    static func convertStringToDictionary(_ text: String) -> [String:AnyObject]? {
//        if let data = text.data(using: String.Encoding.utf8) {
//            do {
//                return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:AnyObject]
//            } catch let error as NSError {
//                print(error)
//            }
//        }
//        return nil
//    }
}
