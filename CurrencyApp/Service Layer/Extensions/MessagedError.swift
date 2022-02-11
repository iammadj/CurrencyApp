//
//  MessagedError.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 11/02/22.
//

import Foundation

struct MessagedError: LocalizedError {
    let message: String
    var errorDescription: String? { message }
}
