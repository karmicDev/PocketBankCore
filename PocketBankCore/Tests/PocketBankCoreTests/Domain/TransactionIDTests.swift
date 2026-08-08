//
//  TransactionIDTests.swift
//  PocketBankCore
//
//  Created by karmic on 8/8/26.
//

import Testing
import Foundation
import PocketBankCore

struct TransactionIDTests {

  @Test
  func createsUniqueTransactionIDs() {
    // Given / When
    let first = TransactionID()
    let second = TransactionID()
    
    
    // Then
    #expect(first != second)
  }

  @Test
  func preservesProvidedUUID() {
    // Given
    let id = UUID()

    // When
    let transactionID = TransactionID(value: id)
    
    // Then
    #expect(id == transactionID.value)
  }

  @Test
  func transactionIDsWithSameUUIDAreEqual() {
    // Given
    let id = UUID()

    // When
    let first = TransactionID(value: id)
    let second = TransactionID(value: id)
    
    // Then
    #expect(first == second)
  }

  @Test
  func transactionIDsWithDifferentUUIDsAreNotEqual() {
    // Given
    let iDFirst = UUID()
    let iDSecond = UUID()

    // When
    let first = TransactionID(value: iDFirst)
    let second = TransactionID(value: iDSecond)

    // Then
    #expect(first != second)
  }

  @Test
  func transactionIDCanBeEncodedAndDecoded() throws {
    // Given
    let original = TransactionID()

    // When
    let encoded = try JSONEncoder().encode(original)
    let decoded = try JSONDecoder().decode(TransactionID.self, from: encoded)

    // Then
    #expect(original == decoded)
  }
}
