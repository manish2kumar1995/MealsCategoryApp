//
//  Errors.swift
//  MealsCategoryApp
//
//  Created by Neosoft on 07/11/23.
//

import Foundation

struct ErrorModel: Codable {
    let status: String?
    let code: String?
    let message: String?
}
