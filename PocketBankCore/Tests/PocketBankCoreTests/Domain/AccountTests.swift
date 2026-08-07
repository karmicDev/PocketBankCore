//
//  Test.swift
//  PocketBankCore
//
//  Created by karmic on 8/7/26.
//

import Testing
import PocketBankCore
import Foundation

struct AccountTests {

  @Test
  func createsAccountWithIDAndCurrency() {
    // Given
    let id = AccountID()
    let currency = Currency.eur

    // When
    let account = Account(id: id, currency: currency)

    // Then
    #expect(account.id == id)
    #expect(account.currency == currency)
  }

  @Test
  func preservesAccountIdentity() {
    // Given
    let id = AccountID()

    // When
    let account = Account(id: id, currency: Currency.eur)

    // Then
    #expect(account.id == id)
  }

  @Test
  func preservesAccountCurrency() {
    // Given
    let currency = Currency.eur

    // When
    let account = Account(currency: currency)

    // Then
    #expect(account.currency == currency)
  }

  @Test
  func accountsWithSameIDAreEqual() {
    // Given
    let id = AccountID()

    // When
    let first = Account(id: id, currency: Currency.eur)
    let second = Account(id: id, currency: Currency.eur)

    // Then
    #expect(first == second)
  }

  @Test
  func accountsWithDifferentIDsAreNotEqual() {
    // Given
    let firstID = AccountID()
    let secondID = AccountID()

    // When
    let first = Account(id: firstID, currency: Currency.eur)
    let second = Account(id: secondID, currency: Currency.eur)

    // Then
    #expect(first != second)
  }

  @Test
  func accountCanBeEncodedAndDecoded() throws {
    // Given
    let original = Account(id: AccountID(), currency: Currency.eur)

    // When
    let encoded = try JSONEncoder().encode(original)
    let decoded = try JSONDecoder().decode(Account.self, from: encoded)

    // Then
    #expect(original == decoded)
  }
}
