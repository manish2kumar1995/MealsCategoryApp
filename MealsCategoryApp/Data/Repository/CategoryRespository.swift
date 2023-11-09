//
//  CategoryRespositoryImpl.swift
//  MealsCategoryApp
//
//  Created by Neosoft on 08/11/23.
//

import Foundation
import PromiseKit

class CategoryRespository: CategoriesListUseCaseProtocol {
    private var apiHandler: NetworkManagerProtocol
    
    init(apiHandler: NetworkManagerProtocol = NetworkManager.shared) {
        self.apiHandler = apiHandler
    }
   
    func getCategoryList(_ id: String)  ->Promise<MealAPIResponse> {
        return Promise{seal in
            let request = MealsListNetworking.fetchCategories(CategroriestListParameters(query: id))
            apiHandler.fetchData(request: request)
                .done { newsResponse in
                    seal.fulfill(newsResponse)}
                .catch { error in
                    seal.reject(error)}
        }
    }
}
