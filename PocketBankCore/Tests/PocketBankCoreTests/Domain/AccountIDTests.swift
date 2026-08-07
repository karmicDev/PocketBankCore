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
  func createAccountIDWithRandomID() {
    // Given
    let accountID = AccountID()
    
    // Then
    #expect(accountID.value.uuidString.isEmpty == false)
  }
  
  @Test
  func createAccountIDWithExistingID() {
    // Given
    let existingID = UUID()
    
    // When
    let accountID = AccountID(value: existingID)
    
    // Then
    #expect(accountID.value == existingID)
  }
}
