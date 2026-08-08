//
//  MoneyTests.swift
//  PocketBankCore
//
//  Created by karmic on 8/7/26.
//

import Testing
import Foundation
import PocketBankCore

struct MoneyTests {

  @Test
  func createsMoneyWithAmountAndCurrency() {
    // Given
    let amount: Decimal = 120000.99
    let currency: Currency = Currency.eur

    // When
    let money = Money(amount: amount, currency: currency)

    // Then
    #expect(money.amount == amount)
    #expect(money.currency == currency)
  }

  @Test
  func allowsZeroAmount() {
    // Given
    let amount: Decimal = 0.00
    let currency: Currency = Currency.eur

    // When
    let money = Money(amount: amount, currency: currency)
    
    // Then
    #expect(money.amount == amount)
    #expect(money.currency == currency)
  }

  @Test
  func allowsNegativeAmount() {
    // Given
    let amount: Decimal = -10.00
    let currency: Currency = Currency.eur

    // When
    let money = Money(amount: amount, currency: currency)
    
    // Then
    #expect(money.amount == amount)
    #expect(money.currency == currency)
  }

  @Test
  func addsMoneyWithSameCurrency() throws{
    // Given
    let amount: Decimal = 10.99
    let currency: Currency = Currency.eur
    let money = Money(amount: amount, currency: currency)

    // When
    let updatedMoney = try money.adding(Money(amount: 10.01, currency: .eur))

    // Then
    #expect(updatedMoney.amount == Decimal(21))
    #expect(updatedMoney.currency == .eur)
  }

  @Test
  func rejectsAddingMoneyWithDifferentCurrencies() {
    // Given
    let money = Money(amount: 10, currency: .eur)

    // Then
    #expect(throws: MoneyError.currencyMismatch) {
      try money.adding(
        Money(amount: 10, currency: .usd)
      )
    }
  }

  @Test
  func moneyWithSameAmountAndCurrencyIsEqual() {
    // Given
    let first = Money(
      amount: 10,
      currency: .eur
    )

    let second = Money(
      amount: 10,
      currency: .eur
    )

    // Then
    #expect(first == second)
  }
}
