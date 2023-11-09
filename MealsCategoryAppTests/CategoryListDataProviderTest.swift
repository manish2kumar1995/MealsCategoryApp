//
//  CategoryListDataProviderTest.swift
//  MealsCategoryAppTests
//
//  Created by Neosoft on 08/11/23.
//

import XCTest
import Nimble

final class CategoryListDataProviderTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMealsCategoryListDataProviderWithRealApi() throws{
        let mealsListDataProvider = MealsRepositoryImpl()
        waitUntil(timeout: .seconds(5)) { done in
            mealsListDataProvider.getMealsList()
                .done { value in
                    expect(value.categories?.count) > 0
                    done()
                }
                .catch { error in
                    expect(error).notTo(beNil())
                    done()
                }
        }
    }
}
