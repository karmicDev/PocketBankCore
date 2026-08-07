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
    
    // When
    
    // Then
  }

  @Test
  func allowsNegativeAmount() {
    // Given
    
    // When
    
    // Then
  }

  @Test
  func addsMoneyWithSameCurrency() {
    // Given
    
    // When
    
    // Then
  }

  @Test
  func rejectsMoneyWithDifferentCurrency() {
    // Given

    // When

    // Then
  }
}
