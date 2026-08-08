//
//  TransactionError.swift
//  PocketBankCore
//
//  Created by karmic on 8/8/26.
//

import Foundation

enum TransactionError: LocalizedError {
  case zeroAmount

  var errorDescription: String {
    switch self {
    case .zeroAmount: return "A Transaction can not have an ammount with value 0.00!"
    }
  }
}
