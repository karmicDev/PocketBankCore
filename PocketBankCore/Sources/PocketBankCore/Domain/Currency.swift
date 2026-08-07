//
//  File.swift
//  PocketBankCore
//
//  Created by karmic on 8/7/26.
//

import Foundation

public struct Currency: Sendable, Hashable, Codable {
  public let code: String

  public init?(code: String) {
    let normalized = code.uppercased()

    guard normalized.count == 3 else {
      return nil
    }

    self.code = normalized
  }
}

public extension Currency {
  static let eur = Currency(code: "EUR")!
  static let usd = Currency(code: "USD")!
  static let gbp = Currency(code: "GBP")!
}
