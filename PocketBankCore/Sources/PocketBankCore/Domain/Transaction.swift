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
  public let timeStamp: Date?
  public let status: TransactionStatus

  public init(
    transactionID: TransactionID,
    accountID: AccountID,
    amount: Money,
    timeStamp: Date? = nil,
    status: TransactionStatus) throws {
      guard amount.amount != 0 else {
        throw TransactionError.zeroAmount
      }

      self.id = transactionID
      self.accountID = accountID
      self.amount = amount
      self.timeStamp = timeStamp ?? Date()
      self.status = status
  }

  public init(
    accountID: AccountID,
    amount: Money,
    timeStamp: Date? = nil,
    status: TransactionStatus) throws {
      try self.init(
        transactionID: TransactionID(),
        accountID: accountID,
        amount: amount,
        timeStamp: timeStamp,
        status: status)
  }
}
