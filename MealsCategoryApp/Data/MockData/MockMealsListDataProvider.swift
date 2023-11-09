//
//  MockMealsListDataProvider.swift
//  MealsCategoryApp
//
//  Created by Neosoft on 09/11/23.
//

import Foundation
import PromiseKit

struct MockMealsListDataProvider: CategoriesListUseCaseProtocol {

    var shouldReturnError: Bool
    private var error: Error = ErrorHandler.generalError
    
    func getCategoryList(_ id: String) -> PromiseKit.Promise<MealAPIResponse> {
        return Promise{seal in
            if shouldReturnError {
                seal.reject(error)
                return
            }
            let jSONObject = MockMealsJson.mockJsonMealsList
            guard let data = try? JSONSerialization.data(withJSONObject: jSONObject, options: .prettyPrinted) else { return seal.reject(error)}
            if let decodedObject = try? JSONDecoder().decode(MealAPIResponse.self, from: data){
                seal.fulfill(decodedObject)
            } else {
                seal.reject(error)
            }
        }
    }
}

struct MockMealsListDataProviderForEmptyArray: CategoriesListUseCaseProtocol {
    private var error: Error = ErrorHandler.generalError

    func getCategoryList(_ id: String) -> PromiseKit.Promise<MealAPIResponse> {
        return Promise{seal in
            let jSONObject = MockMealsJson.mockJsonCategoryList
            guard let data = try? JSONSerialization.data(withJSONObject: jSONObject, options: .prettyPrinted) else { return seal.reject(error)}
            if let decodedObject = try? JSONDecoder().decode(MealAPIResponse.self, from: data){
                seal.fulfill(decodedObject)
            } else {
                seal.reject(error)
            }
        }
    }
}

