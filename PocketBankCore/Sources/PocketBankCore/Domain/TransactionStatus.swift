//
//  TransactionStatus.swift
//  PocketBankCore
//
//  Created by karmic on 8/8/26.
//

import Foundation

public enum TransactionStatus: Sendable, Hashable, Codable {
  case pending
  case completed
  case failed
}
