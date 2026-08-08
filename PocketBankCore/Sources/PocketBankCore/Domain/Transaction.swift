//
//  Transaction.swift
//  PocketBankCore
//
//  Created by karmic on 8/8/26.
//

import Foundation

public struct Transaction: Sendable, Hashable, Codable {
  public let id: TransactionID
  public let accountID: AccountID
  public let amount: Money
  public let timestamp: Date
  public let status: TransactionStatus

  public init(
    id: TransactionID,
    accountID: AccountID,
    amount: Money,
    timestamp: Date? = nil,
    status: TransactionStatus) throws {
      guard amount.amount != 0 else {
        throw TransactionError.zeroAmount
      }

      self.id = id
      self.accountID = accountID
      self.amount = amount
      self.timestamp = timestamp ?? Date()
      self.status = status
  }

  public init(
    accountID: AccountID,
    amount: Money,
    timestamp: Date? = nil,
    status: TransactionStatus) throws {
      try self.init(
        id: TransactionID(),
        accountID: accountID,
        amount: amount,
        timestamp: timestamp,
        status: status)
  }
}
