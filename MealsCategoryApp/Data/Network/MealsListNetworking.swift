//
//  MealsListNetworking.swift
//  MealsCategoryApp
//
//  Created by Neosoft on 07/11/23.
//


import Foundation
import Alamofire

enum MealsListNetworking {
    case fetchMeals
    case fetchCategories(CategroriestListParameters)
}

extension MealsListNetworking: ApiRequest {
    var baseURL: String {
        return NetworkConstants.baseURL
    }
    
    var path: String {
        switch self {
        case .fetchMeals:
            return NetworkConstants.getMealsList
        case .fetchCategories:
            return NetworkConstants.getCategoryList
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchMeals:
            return .get
        case .fetchCategories:
            return .get
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .fetchMeals:
            return [:]
        case .fetchCategories(let param):
            return param.toJSON()
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .fetchMeals:
            return nil
        case .fetchCategories:
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .fetchMeals:
            return URLEncoding.default
        case .fetchCategories:
            return URLEncoding.default
        }
    }
}
