//
//  File.swift
//  ExtDomainModel
//
//  Created by Thomas on 10/15/16.
//  Copyright © 2016 Thomas Tseng. All rights reserved.
//

import XCTest

import SimpleDomainModel

class ExtTests: XCTestCase {
    
    func testPrintMoney() {
        let money = Money(amount: 10, currency: Money.Currency.USD)
        XCTAssert(money.description == "USD10.0")
    }
    
    func testPrintJob() {
        let job = Job(title: "Janitor", type: Job.JobType.Hourly(15.0))
        XCTAssert(job.description == "Janitor 15")
    }
    
    func testPrintPerson() {
        let ted = Person(firstName: "Ted", lastName: "Neward", age: 45)
        XCTAssert(ted.toString() == "[Person: firstName:Ted lastName:Neward age:45 job:nil spouse:nil]")
    }
    
    func testPrintFamily() {
        let ted = Person(firstName: "Ted", lastName: "Neward", age: 45)
        ted.job = Job(title: "Guest Lecturer", type: Job.JobType.Salary(1000))
        
        let charlotte = Person(firstName: "Charlotte", lastName: "Neward", age: 45)
        
        let family = Family(spouse1: ted, spouse2: charlotte)
        
        XCTAssert(family.description == "[Num: 2, Income: 1000]")
    }
    
    let tenUSD = Money(amount: 10, currency: Money.Currency.USD)
    
    func testAdd() {
        let total = tenUSD.add(tenUSD)
        XCTAssert(total.amount == 20)
        XCTAssert(total.currency == Money.Currency.USD)
    }
    
    func testSubtract() {
        let total = tenUSD.add(tenUSD)
        XCTAssert(total.amount == 20)
        XCTAssert(total.currency == Money.Currency.USD)
    }

}

