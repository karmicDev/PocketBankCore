//
//  Test.swift
//  PocketBankCore
//
//  Created by karmic on 8/8/26.
//

import Testing
import Foundation
import PocketBankCore

struct TransactionTests {

  @Test
  func createsTransactionWithRequiredProperties() throws {
    // Given
    let id = TransactionID()
    let accountID = AccountID()
    let amount = Money(amount: 100, currency: .eur)
    let timeStamp = Date()
    let status = TransactionStatus.pending

    // When
    let transaction = try Transaction(
      transactionID: id,
      accountID: accountID,
      amount: amount,
      timeStamp: timeStamp,
      status: status)

    // Then
    #expect(id == transaction.id)
    #expect(accountID == transaction.accountID)
    #expect(amount == transaction.amount)
    #expect(timeStamp == transaction.timeStamp)
    #expect(status == transaction.status)
  }

  @Test
  func generatesUniqueTransactionID() throws {
    // Given / When
    let first = try Transaction(
      accountID: AccountID(),
      amount: Money(amount: 100, currency: .eur),
      status: TransactionStatus.pending)
    let seccond = try Transaction(
      accountID: AccountID(),
      amount: Money(amount: 100, currency: .eur),
      status: TransactionStatus.pending)
    
    // Then
    #expect(first != seccond)
  }

  @Test
  func preservesExplictProvidedTransactionID() throws {
    // Given
    let id = TransactionID()
    
    // When
    let transaction = try Transaction(
      transactionID: id,
      accountID: AccountID(),
      amount: Money(amount: 100, currency: .eur),
      status: TransactionStatus.pending)

    // Then
    #expect(id == transaction.id)
  }

  @Test
  func preservesAccountID() throws {
    // Given
    let accountID = AccountID()

    // When
    let transaction = try Transaction(
      accountID: accountID,
      amount: Money(amount: 100, currency: .eur),
      status: TransactionStatus.pending)

    // Then
    #expect(accountID == transaction.accountID)
  }

  @Test
  func acceptsPositiveAmounts() throws {
    // Given / When
    let transaction = try Transaction(
      accountID: AccountID(),
      amount: Money(amount: 100, currency: .eur),
      status: TransactionStatus.pending)

    // Then
    #expect(transaction.amount.amount > 0)
  }

  @Test
  func accesptsNegativeAmounts() throws {
    // Given / When
    let transaction = try Transaction(
      accountID: AccountID(),
      amount: Money(amount: -100, currency: .eur),
      status: TransactionStatus.pending)
    
    // Then
    #expect(transaction.amount.amount < 0)
  }

  @Test
  func rejectsZeroAmounts() throws {
    // Given
    let amount = Money(amount: 0, currency: .eur)

    // Then
    #expect(throws: TransactionError.zeroAmount) {
      try Transaction(
        accountID: AccountID(),
        amount: amount,
        status: TransactionStatus.pending)
    }
  }

  @Test
  func preservesTransactionStatus() throws {
    // Given
    let status = TransactionStatus.pending
    
    //Then
    let transaction = try Transaction(
      accountID: AccountID(),
      amount: Money(amount: 100, currency: .eur),
      status: status)

    // Then
    #expect(status == transaction.status)
  }

  @Test
  func supportsPending() throws {
    // Given /Then
    let transaction = try Transaction(
      accountID: AccountID(),
      amount: Money(amount: 100, currency: .eur),
      status: TransactionStatus.pending)

    // Then
    #expect(transaction.status == TransactionStatus.pending)
  }
  
  @Test
  func supportsCompleted() throws {
    // Given /Then
    let transaction = try Transaction(
      accountID: AccountID(),
      amount: Money(amount: 100, currency: .eur),
      status: TransactionStatus.completed)

    // Then
    #expect(transaction.status == TransactionStatus.completed)
  }

  @Test
  func supportsFailed() throws {
    // Given /Then
    let transaction = try Transaction(
      accountID: AccountID(),
      amount: Money(amount: 100, currency: .eur),
      status: TransactionStatus.failed)
    
    // Then
    #expect(transaction.status == TransactionStatus.failed)
  }

  @Test
  func supportsCodable() throws {
    // Given
    let original = try Transaction(
      accountID: AccountID(),
      amount: Money(amount: 100, currency: .eur),
      status: TransactionStatus.failed)

    // When
    let encoded = try JSONEncoder().encode(original)
    let decoded = try JSONDecoder().decode(Transaction.self, from: encoded)

    // Then
    #expect(original == decoded)
  }
}
