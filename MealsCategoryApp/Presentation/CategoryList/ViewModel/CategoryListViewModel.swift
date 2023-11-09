//
//  CategoryListViewModel.swift
//  MealsCategoryApp
//
//  Created by Neosoft on 07/11/23.
//

import Foundation

protocol CategoryListProtocol {
    func fetchCategoryList()
    func getTotalCategoryCount() -> Int
    func getScreenTitle() -> String
    var getLoadingState: ((MealsListState) -> Void) { get set}
    func fetchParticularMeal(at index: Int) -> Meal?
}

class CategoryListViewModel: CategoryListProtocol {
    private let categoryUseCase: CategoriesListUseCaseProtocol
    private var categoryMealsArray = [Meal]()
    var categoryId: String?
    var getLoadingState: ((MealsListState) -> Void) = {_ in }

    init(useCaseProvider: CategoriesListUseCaseProtocol) {
        self.categoryUseCase = useCaseProvider
    }

    func fetchCategoryList() {
        self.getLoadingState(.loading)
        categoryUseCase.getCategoryList(categoryId ?? "")
            .done { mealsResponse in
                debugPrint(mealsResponse)
                self.setData(items: mealsResponse.meals ?? [])
            }
            .catch { error in
              //  self.getLoadingState(.error(error))
            }
    }
    
    func getTotalCategoryCount() -> Int {
        return categoryMealsArray.count
    }
    
    func getScreenTitle() -> String {
        return self.categoryId ?? ""
    }
    
    func fetchParticularMeal(at index: Int) -> Meal? {
        if categoryMealsArray.indices.contains(index) {
            return categoryMealsArray[index]
        } else {
            return nil
        }
    }
    
    private func setData(items: [Meal]) {
        if items.isEmpty {
            getLoadingState(.empty)
        } else {
            self.categoryMealsArray.append(contentsOf: items)
            self.getLoadingState(.populated)
        }
    }
}
