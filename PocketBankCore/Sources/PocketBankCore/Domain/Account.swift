//
//  File.swift
//  PocketBankCore
//
//  Created by karmic on 8/7/26.
//

import Foundation

public struct Account: Sendable, Hashable, Codable {
  public let id: AccountID
  public let currency: Currency

  public init(currency: Currency) {
    self.id = AccountID()
    self.currency = currency
  }

  public init(id: AccountID, currency: Currency) {
    self.id = id
    self.currency = currency
  }
}
