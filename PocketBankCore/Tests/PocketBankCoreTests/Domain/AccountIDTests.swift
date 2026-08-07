//
//  Test.swift
//  PocketBankCore
//
//  Created by karmic on 8/7/26.
//

import Testing
import PocketBankCore
import Foundation

struct AccountIDTests {

  @Test
  func createUniqueAccountIDs() {
    // Given
    let first = AccountID()
    let second = AccountID()

    // Then
    #expect(first != second)
  }

  @Test
  func preservesProvidedUUID() {
    // Given
    let existingID = UUID()

    // When
    let accountID = AccountID(value: existingID)

    // Then
    #expect(accountID.value == existingID)
  }

  @Test
  func accountsWithSameUUIDAreEqual() {
    // Given
    let uuid = UUID()

    // When
    let first = AccountID(value: uuid)
    let second = AccountID(value: uuid)

    // Then
    #expect(first == second)
  }

  @Test
  func accountsWithDifferentUUIDAreNotEqual() {
    // Given
    let first = AccountID()
    let second = AccountID()

    // Then
    #expect(first != second)
  }

  @Test
  func accountIDCanBeEncodedAndDecoded() throws {
    // Given
    let original = AccountID()

    // When
    let data = try JSONEncoder().encode(original)
    let decoded = try JSONDecoder().decode(AccountID.self, from: data)

    // Then
    #expect(original == decoded)
  }
}
