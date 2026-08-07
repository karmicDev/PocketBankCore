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
}
