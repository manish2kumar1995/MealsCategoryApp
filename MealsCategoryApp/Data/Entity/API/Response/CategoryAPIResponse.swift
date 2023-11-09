//
//  CategoryAPIResponse.swift
//  MealsCategoryApp
//
//  Created by Neosoft on 08/11/23.
//

import Foundation

struct MealAPIResponse: Codable {
    let meals: [Meal]?
}

struct Meal: Codable {
    let mealName: String?
    let mealThumbImage: String?
    let id: String?
    
    enum CodingKeys: String, CodingKey {
        case mealName = "strMeal"
        case mealThumbImage = "strMealThumb"
        case id = "idMeal"
    }
}
