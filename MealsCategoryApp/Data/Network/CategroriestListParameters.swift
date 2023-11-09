//
//  CategroriestListParameters.swift
///  MealsCategoryApp
//
//  Created by Neosoft on 07/11/23.
//


import Foundation

struct CategroriestListParameters: Codable {
    let name: String?
    
        enum CodingKeys: String, CodingKey {
            case name = "c"
        }
    
    internal init(query: String? = nil) {
            self.name = query
        }
}
