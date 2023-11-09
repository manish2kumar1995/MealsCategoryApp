//
//  MealsRepositoryImpl.swift
//  MealsCategoryApp
//
//  Created by Neosoft on 08/11/23.
//

import Foundation
import PromiseKit

class MealsRepository: MealsUseCaseProtocol {
    private var apiHandler: NetworkManagerProtocol
    
    init(apiHandler: NetworkManagerProtocol = NetworkManager.shared) {
        self.apiHandler = apiHandler
    }
   
    func getMealsList() ->Promise<MealListResponse> {
        return Promise{seal in
            let request = MealsListNetworking.fetchMeals
            apiHandler.fetchData(request: request)
                .done { newsResponse in
                    seal.fulfill(newsResponse)}
                .catch { error in
                    seal.reject(error)}
        }
    }
}
