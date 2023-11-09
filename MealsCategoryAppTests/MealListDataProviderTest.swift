//
//  MealListDataProviderTest.swift
//  MealsCategoryAppTests
//
//  Created by Neosoft on 09/11/23.
//

import XCTest
import Nimble

final class MealListDataProviderTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMealsListDataProviderWithRealApi() throws{
        let mealsListDataProvider = CategoryRespositoryImpl()
        waitUntil(timeout: .seconds(5)) { done in
            mealsListDataProvider.getCategoryList("Seafood")
                .done { value in
                    expect(value.meals?.count) > 0
                    done()
                }
                .catch { error in
                    expect(error).notTo(beNil())
                    done()
                }
        }
    }

}
