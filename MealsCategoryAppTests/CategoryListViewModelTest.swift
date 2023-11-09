//
//  CategoryListViewModelTest.swift
//  MealsCategoryAppTests
//
//  Created by Neosoft on 08/11/23.
//

import XCTest
import Nimble
@testable import MealsCategoryApp

final class CategoryListViewModelTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCategoryListViewModelWithCategories() throws {
        let mockCategoryListDataProvider = MockCategoryListDataProvider(shouldReturnError: false)
        let mealsCategoryListViewModel = MealsCategoryViewModel(useCaseProvider: mockCategoryListDataProvider)
        mealsCategoryListViewModel.getMealsList()
        expect(mealsCategoryListViewModel.getTotalMealsCount()).toEventually(equal(14))
    }
    
    func testNewsListViewModelForEmptyArray() throws{

        let mockCategoryListDataProvider = MockCategoryListDataProviderForEmptyArray()
        let mealsCategoryListViewModel = MealsCategoryViewModel(useCaseProvider: mockCategoryListDataProvider)
        mealsCategoryListViewModel.getMealsList()
        expect(mealsCategoryListViewModel.getTotalMealsCount()) == 0
    }

}
