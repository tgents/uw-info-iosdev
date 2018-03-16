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
// Domain Part 2
//
protocol Mathematics {
  func add(_ to: Money) -> Money
  func subtract(_ from: Money) -> Money
}

extension Double {
  var USD: Money { return Money(amount: self, currency: Money.Currency.USD)}
  var GBP: Money { return Money(amount: self, currency: Money.Currency.GBP) }
  var EUR: Money { return Money(amount: self, currency: Money.Currency.EUR) }
  var CAN: Money { return Money(amount: self, currency: Money.Currency.CAN) }
  var YEN: Money { return Money(amount: self, currency: Money.Currency.YEN) }
}

////////////////////////////////////
// Money
//
public struct Money: CustomStringConvertible, Mathematics {
  
  public var description: String {
    return "\(currency)\(amount)"
  }

  public let acceptedCurrencies = ["USD", "GBP", "EUR", "CAN"]
  public var amount : Double
  public var currency : Currency
  
  public enum Currency {
    case USD
    case GBP
    case EUR
    case CAN
    case YEN
  }
  
  public func convert(_ to: Currency) -> Money {
    var newAmount = convertToUSD(amount: amount, currency: currency)
    switch to{
    case Currency.USD:
      break
    case Currency.GBP:
      newAmount = newAmount / 2
    case Currency.EUR:
      newAmount = newAmount * 3 / 2
    case Currency.CAN:
      newAmount = newAmount * 5 / 4
    case Currency.YEN:
      newAmount = newAmount * 100
    }
    return Money(amount: newAmount, currency: to)
  }
  
  private func convertToUSD(amount: Double, currency: Currency) -> Double{
    switch currency{
    case Currency.USD:
      return amount
    case Currency.GBP:
      return amount * 2
    case Currency.EUR:
      return amount * 2 / 3
    case Currency.CAN:
      return amount * 4 / 5
    case Currency.YEN:
      return amount / 100
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
open class Job: CustomStringConvertible {
  
  public var description: String {
    return "\(title) \(calculateIncome(1))"
  }
  
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
open class Person : CustomStringConvertible {
  
  public var description: String {
    return "[Person: firstName:\(firstName) lastName:\(lastName) age:\(age) job:\(job) spouse:\(spouse)]"
  }
  open var firstName : String = ""
  open var lastName : String = ""
  open var age : Int = 0

  fileprivate var _job : Job? = nil
  open var job : Job? {
    get {
      return _job
    }
    set(value) {
      if(age < 16){
        _job = nil
      } else {
        _job = value
      }
    }
  }
  
  fileprivate var _spouse : Person? = nil
  open var spouse : Person? {
    get {
      return _spouse
    }
    set(value) {
      if(age < 18){
        _spouse = nil
      } else {
        _spouse = value
      }
      
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

////////////////////////////////////
// Family
//
open class Family : CustomStringConvertible {
  
  public var description: String {
    return "[Num: \(members.count), Income: \(householdIncome())]"
  }
  
  fileprivate var members : [Person] = []
  
  public init(spouse1: Person, spouse2: Person) {
    if spouse1.spouse == nil && spouse2.spouse == nil {
      spouse1.spouse = spouse2
      spouse2.spouse = spouse1
      members.append(spouse1)
      members.append(spouse2)
    }
  }
  
  open func haveChild(_ child: Person) -> Bool {
    if canHaveChild() {
      members.append(child)
      return true
    }
    return false
  }
  
  private func canHaveChild() -> Bool {
    for index in 0...members.count - 1 {
      let age = members[index].age
      if age >= 21 {
        return true
      }
    }
    return false
  }
  
  open func householdIncome() -> Int {
    var totalIncome: Int = 0
    for index in 0...members.count - 1 {
      let job = members[index].job
      if job != nil{
        totalIncome += job!.calculateIncome(2000)
      }
    }
    return totalIncome
  }
}





