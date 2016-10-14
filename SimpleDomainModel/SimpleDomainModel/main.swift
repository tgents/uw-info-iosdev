//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

print("Hello, World!")

public func testMe() -> String {
  return "I have been tested"
}

open class TestMe {
  open func Please() -> String {
    return "I have been tested"
  }
}

////////////////////////////////////
// Money
//
public struct Money {
  public let acceptedCurrencies = ["USD", "GBP", "EUR", "CAN"]
  public var amount : Int
  public var currency : String
  
  public func convert(_ to: String) -> Money {
    var newAmount = convertToUSD(amount: amount, currency: currency)
    switch to{
    case acceptedCurrencies[0]:
      break
    case acceptedCurrencies[1]:
      newAmount = newAmount / 2
    case acceptedCurrencies[2]:
      newAmount = newAmount * 3 / 2
    case acceptedCurrencies[3]:
      newAmount = newAmount * 5 / 4
    default:
      break
    }
    return Money(amount: newAmount, currency: to)
  }
  
  private func convertToUSD(amount: Int, currency: String) -> Int{
    switch currency{
    case acceptedCurrencies[0]:
      return amount
    case acceptedCurrencies[1]:
      return amount * 2
    case acceptedCurrencies[2]:
      return amount * 2 / 3
    case acceptedCurrencies[3]:
      return amount * 4 / 5
    default:
      return amount
    }
  }
  
  public func add(_ to: Money) -> Money {
    var addAmount = amount
    if(to.currency != currency){
      addAmount = convert(to.currency).amount
    }
    return Money(amount: addAmount + to.amount, currency: to.currency)
  }
  public func subtract(_ from: Money) -> Money {
    var addAmount = amount
    if(from.currency != currency){
      addAmount = convert(from.currency).amount
    }
    return Money(amount: addAmount - from.amount, currency: from.currency)
  }
}

////////////////////////////////////
// Job
//
open class Job {
  fileprivate var title : String
  fileprivate var type : JobType

  public enum JobType {
    case Hourly(Double)
    case Salary(Int)
  }
  
  public init(title : String, type : JobType) {
    self.title = title
    self.type = type
  }
  
  open func calculateIncome(_ hours: Int) -> Int {
    switch type{
    case .Hourly(let rate):
      return Int(Double(hours) * rate)
    case .Salary(let rate):
      return rate
    }
  }
  
//  open func raise(_ amt : Double) {
//    switch type{
//    case .Hourly(let rate):
//      type = JobType.Hourly(rate * amt / 100.0 + rate)
//    case .Salary(let rate):
//      type = JobType.Salary(Int(Double(rate) * amt / 100.0) + rate)
//    }
//  }
  
  open func raise(_ amt : Double) {
    switch type{
    case .Hourly(let rate):
      type = JobType.Hourly(amt + rate)
    case .Salary(let rate):
      type = JobType.Salary(Int(amt) + rate)
    }
  }
}

////////////////////////////////////
// Person
//
open class Person {
  open var firstName : String = ""
  open var lastName : String = ""
  open var age : Int = 0

  fileprivate var _job : Job? = nil
  open var job : Job? {
    get {
      return _job
    }
    set(value) {
      _job = value
    }
  }
  
  fileprivate var _spouse : Person? = nil
  open var spouse : Person? {
    get {
      return _spouse
    }
    set(value) {
      _spouse = value
    }
  }
  
  public init(firstName : String, lastName: String, age : Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age
  }
  
  open func toString() -> String {
    return "[Person: firstName:\(firstName) lastName:\(lastName) age:\(age) job:\(job) spouse:\(spouse)]"
  }
}

//////////////////////////////////////
//// Family
////
//open class Family {
//  fileprivate var members : [Person] = []
//  
//  public init(spouse1: Person, spouse2: Person) {
//  }
//  
//  open func haveChild(_ child: Person) -> Bool {
//  }
//  
//  open func householdIncome() -> Int {
//  }
//}





