//
//  Test.swift
//  PocketBankCore
//
//  Created by karmic on 8/7/26.
//

import Testing
import PocketBankCore

struct CurrencyTests {

  @Test
  func normalizesCurrencyCodeToUppercase() throws {
    // Given
    let input = "eur"

    // When
    let currency = try #require(Currency(code: input))

    // Then
    #expect(currency.code == "EUR")
  }

  @Test
  func trimsWhitespaceAroundCurrencyCode() throws {
    // Given
    let input = " eur "

    // When
    let currency = try #require(Currency(code: input))

    // Then
    #expect(currency.code == "EUR")
  }

  @Test
  func createsCurrencyFromValidCode() throws {
    // Given
    let input = "eur"

    // When
    let currency = try #require(Currency(code: input))

    // Then
    #expect(currency.code == "EUR")
  }

  @Test
  func rejectsCurrencyCodeShorterThanThreeCharacters() {
    // Given
    let input = "eu"

    // When
    let currency = Currency(code: input)

    // Then
    #expect(currency == nil)
  }

  @Test
  func rejectsCurrencyCodeLongerThanThreeCharacters() {
    // Given
    let input = "euro"

    // When
    let currency = Currency(code: input)

    // Then
    #expect(currency == nil)
  }

  @Test
  func currenciesWithSameCodeAreEqual() throws {
    // Given
    let inputFirst = "EUR"
    let inputSecond = "eur"

    // When
    let first = try #require(Currency(code: inputFirst))
    let second = try #require(Currency(code: inputSecond))

    // Then
    #expect(first == second)
  }
}
