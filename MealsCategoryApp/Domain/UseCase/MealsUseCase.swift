//
//  MealsUseCase.swift
//  MealsCategoryApp
//
//  Created by Neosoft on 07/11/23.
//

import Foundation
import PromiseKit

protocol MealsUseCaseProtocol {
    func getMealsList() ->Promise<MealListResponse>
}
