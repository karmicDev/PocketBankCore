//
//  TransactionError.swift
//  PocketBankCore
//
//  Created by karmic on 8/8/26.
//

import Foundation

public enum TransactionError: LocalizedError {
  case zeroAmount

  public var errorDescription: String {
    switch self {
    case .zeroAmount: return "A transaction cannot have an amount of zero."
    }
  }
}
