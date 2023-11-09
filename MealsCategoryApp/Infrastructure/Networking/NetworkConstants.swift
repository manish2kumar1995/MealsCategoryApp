//
//  NetworkConstants.swift
//  MealsCategoryApp
//
//  Created by Neosoft on 07/11/23.
//

import Foundation

// Sample apiKeys
//bff9ffaa7ddf4de38b14909e62e49061
//cc15cd9e16604a70888d3baef0c9f083
//5a930c8356d14db2bd475d72f7be713c
//0284b9b5ed9549b5a331a40c81c63d3a
enum NetworkConstants {
    static let baseURL = "https://www.themealdb.com/api/json/v1/1/"
    static let getMealsList = "categories.php"
    static let getCategoryList = "filter.php"
}

