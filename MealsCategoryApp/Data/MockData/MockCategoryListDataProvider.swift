//
//  MockCategoryListDataProvider.swift
//  MealsCategoryApp
//
//  Created by Neosoft on 08/11/23.
//

import Foundation
import PromiseKit

struct MockCategoryListDataProvider: MealsUseCaseProtocol {

    var shouldReturnError: Bool
    private var error: Error = ErrorHandler.generalError
    
    func getMealsList() -> PromiseKit.Promise<MealListResponse> {
        return Promise{seal in
            if shouldReturnError {
                seal.reject(error)
                return
            }
            let jSONObject = MockMealsJson.mockJsonCategoryList
            guard let data = try? JSONSerialization.data(withJSONObject: jSONObject, options: .prettyPrinted) else { return  seal.reject(error)}
            if let decodedObject = try? JSONDecoder().decode(MealListResponse.self, from: data) {
                seal.fulfill(decodedObject)
            } else {
                seal.reject(error)
            }
        }
    }
    
}

struct MockCategoryListDataProviderForEmptyArray: MealsUseCaseProtocol {
    private var error: Error = ErrorHandler.generalError

    func getMealsList() -> PromiseKit.Promise<MealListResponse> {
        return Promise{seal in
            let jSONObject = MockMealsJson.mockEmptyJSONResponse
            guard let data = try? JSONSerialization.data(withJSONObject: jSONObject, options: .prettyPrinted) else { return seal.reject(error) }
            if let decodedObject = try? JSONDecoder().decode(MealListResponse.self, from: data) {
                seal.fulfill(decodedObject)
            } else {
                seal.reject(error)
            }
        }
    }
}

