//
//  File.swift
//  PocketBankCore
//
//  Created by karmic on 8/7/26.
//

import Foundation

public enum MoneyError: Error {
  case currencyMismatch
}

public extension MoneyError {
  var errorDescription: String {
    switch self {
    case .currencyMismatch:
      return "Currency Mismatch: This operation only supports matching currencies."
    }
  }
}
