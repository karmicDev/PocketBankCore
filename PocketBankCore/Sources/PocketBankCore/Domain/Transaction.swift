//
//  Transaction.swift
//  PocketBankCore
//
//  Created by karmic on 8/8/26.
//

import Foundation

public struct Transaction: Sendable, Hashable, Codable {
  public let transactionID: TransactionID
  public let accountID: AccountID
  public let amount: Money
  public let timestamp: Date
  public let status: TransactionStatus

  public init(
    transactionID: TransactionID,
    accountID: AccountID,
    amount: Money,
    date: Date?,
    status: TransactionStatus) throws {
      guard amount.amount != Decimal(0.00) else {
        throw TransactionError.zeroAmount
      }

      self.transactionID = transactionID
      self.accountID = accountID
      self.amount = amount
      self.timestamp = date ?? Date()
      self.status = status
  }

  public init(
    accountID: AccountID,
    amount: Money,
    date: Date?,
    status: TransactionStatus) throws {
      guard amount.amount != Decimal(0.00) else {
        throw TransactionError.zeroAmount
      }

      self.transactionID = TransactionID()
      self.accountID = accountID
      self.amount = amount
      self.timestamp = date ?? Date()
      self.status = status
  }
}
