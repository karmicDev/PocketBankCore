//
//  File.swift
//  PocketBankCore
//
//  Created by karmic on 8/7/26.
//

import Foundation

public struct Money: Sendable, Hashable, Codable {
  public let amount: Decimal
  public let currency: Currency

  public init(amount: Decimal, currency: Currency) {
    self.amount = amount
    self.currency = currency
  }
  
  public func adding(_ other: Money) throws -> Money {
    guard self.currency == other.currency else {
      throw MoneyError.currencyMismatch
    }
    
    return Money(
      amount: amount + other.amount,
      currency: self.currency
    )
  }
}
