//
//  MealsCategoryViewModel.swift
//  MealsCategoryApp
//
//  Created by Neosoft on 07/11/23.
//

import Foundation

protocol MealsListProtocol {
    func getMealsList()
    func getTotalMealsCount() -> Int
    func fetchParticularMeal(at index: Int) -> Category?
    func collapseCell(at index: Int)
    func getCellEstimatedHeight(at index: Int) -> Int?
    var mealsResponse: MealListResponse? {get}
    var getLoadingState: ((MealsListState) -> Void) { get set}
}

class MealsCategoryViewModel: MealsListProtocol {
    private let mealsUseCase: MealsUseCaseProtocol
    private(set) var mealsResponse: MealListResponse?
    private var mealsArray = [Category]()
    var getLoadingState: ((MealsListState) -> Void) = {_ in }

    init(useCaseProvider: MealsUseCaseProtocol) {
        self.mealsUseCase = useCaseProvider
    }
    
    func getMealsList() {
        self.getLoadingState(.loading)
        self.mealsUseCase.getMealsList()
            .done { mealsResponse in
                self.setData(items: mealsResponse.categories ?? [])
            }
            .catch { error in
              //  self.getLoadingState(.error(error))
            }
    }
    
    func getTotalMealsCount() -> Int {
       return self.mealsArray.count
    }
    
    func collapseCell(at index: Int){
        self.mealsArray[index].isExpanded = !(self.mealsArray[index].isExpanded ?? false)
        getLoadingState(.reloadRow(index))
    }
    
    func fetchParticularMeal(at index: Int) -> Category? {
        if self.mealsArray.indices.contains(index) {
            return self.mealsArray[index]
        } else {
            return nil
        }
    }
    
    func getCellEstimatedHeight(at index: Int) -> Int? {
        return (mealsArray[index].isExpanded ?? false) ? nil : 120
    }
    
    private func setData(items: [Category]) {
        if items.isEmpty {
            getLoadingState(.empty)
        } else {
            self.mealsArray.append(contentsOf: items)
            self.getLoadingState(.populated)
        }
    }
}

// MARK: - News List View States
enum MealsListState {
    case loading
    case error(Error)
    case empty
    case populated
    case reloadRow(Int)
}
