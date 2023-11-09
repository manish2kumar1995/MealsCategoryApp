//
//  MealListViewModelTest.swift
//  MealsCategoryAppTests
//
//  Created by Neosoft on 08/11/23.
//

import XCTest
import Nimble

final class MealListViewModelTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCategoryListViewModelWithCategories() throws {
        let mockMealListDataProvider = MockMealsListDataProvider(shouldReturnError: false)
        let categoryListViewModel = CategoryListViewModel(useCaseProvider: mockMealListDataProvider)
        categoryListViewModel.categoryId = "Seafood"
        categoryListViewModel.fetchCategoryList()
        expect(categoryListViewModel.getTotalCategoryCount()).toEventually(equal(9))
        expect(categoryListViewModel.getScreenTitle()).toEventually(equal("Seafood"))
    }
    
    func testNewsListViewModelForEmptyArray() throws{

        let mockMealListDataProvider = MockMealsListDataProviderForEmptyArray()
        let categoryListViewModel = CategoryListViewModel(useCaseProvider: mockMealListDataProvider)
        categoryListViewModel.categoryId = "fdfgdf"
        categoryListViewModel.fetchCategoryList()
        expect(categoryListViewModel.getTotalCategoryCount()) == 0
    }
    
}
