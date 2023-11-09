//
//  ErrorConstants.swift
///  MealsCategoryApp
//
//  Created by Neosoft on 07/11/23.
//

import Foundation

// MARK: - ErrorConstants
enum ErrorHandler: Error {
    case selectFields
    case generalError
    case custom(String)
    case invalidURL
    var localisedDescription: String {
        switch self {
        case .selectFields:
            return "Please select all fields"
        case .generalError:
            return "Something went wrong, please try again"
        case .custom(let message):
            return message
        case .invalidURL:
            return "Invalid URL"
        }
    }
}


