//
//  Test.swift
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
    if money.currency != updatedMoney.currency {
      throw MoneyError.currencyMismatch
    }
    
    // Then
    #expect(updatedMoney.amount == 21.00)
  }

  @Test
  func rejectsMoneyWithDifferentCurrency() throws {
    let amount: Decimal = 10.99
    let currency: Currency = Currency.eur
    let money = Money(amount: amount, currency: currency)

    // When
    do {
      let updatedMoney = try money.adding(Money(amount: 10.01, currency: .usd))
      // Then
      #expect(money.amount == amount)
      
    } catch {
      // Then
      // ???
    }
  }
}
