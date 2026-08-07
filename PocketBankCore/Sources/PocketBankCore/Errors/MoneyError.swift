//
//  File.swift
//  PocketBankCore
//
//  Created by karmic on 8/7/26.
//

import Foundation

public enum MoneyError: LocalizedError {
    case currencyMismatch

    public var errorDescription: String? {
        switch self {
        case .currencyMismatch:
            return "Cannot perform arithmetic on different currencies."
        }
    }
}
