//
//  File.swift
//  PocketBankCore
//
//  Created by karmic on 8/7/26.
//

import Foundation

public struct AccountID: Sendable, Hashable, Codable {
  public let value: UUID

  public init() {
    self.value = UUID()
  }

  public init(value: UUID) {
    self.value = value
  }
}
