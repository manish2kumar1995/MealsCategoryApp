//
//  MealListResponse.swift
//  MealsCategoryApp
//
//  Created by Neosoft on 08/11/23.
//

import Foundation

// MARK: - MealListResponse
struct MealListResponse: Decodable {
    let categories: [Category]?
}

// MARK: - Category
struct Category: Decodable {
    let id, categoryName: String?
    let categoryThumbImage: String?
    let categoryDescription: String?
    var isExpanded: Bool? = false
    
    enum CodingKeys: String, CodingKey {

        case id = "idCategory"
        case categoryName = "strCategory"
        case categoryThumbImage = "strCategoryThumb"
        case categoryDescription = "strCategoryDescription"
        case isExpanded = "isExpanded"
    }
}
