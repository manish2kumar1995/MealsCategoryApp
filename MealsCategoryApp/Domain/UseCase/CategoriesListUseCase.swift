//
//  CategoriesListUseCase.swift
//  MealsCategoryApp
//
//  Created by Neosoft on 08/11/23.
//

import Foundation
import PromiseKit

protocol CategoriesListUseCaseProtocol {
    func getCategoryList(_ id: String)  ->Promise<MealAPIResponse>
}
