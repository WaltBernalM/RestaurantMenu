//
//  RestaurantMenuTests.swift
//  RestaurantMenuTests
//
//  Created by Walter Bernal Montero on 28/09/23.
//

import XCTest
@testable import RestaurantMenu
final class RestaurantMenuTests: XCTestCase {
    func test_meniItemTitle_initWithTitle_menuItemTitleEqualsInitTitle() {
        let menuItem = MenuItem(title: "Test")
        XCTAssert(menuItem.title == "Test")
    }
    func test_menuItemIngredients_initWithIngredients_menuItemIgredientsEqualsInitIngredients() {
        let menuItem = MenuItem(ingredients: [.pasta, .spinach, .tomatoSauce])
        XCTAssert(menuItem.ingredients == [Ingredient.pasta, Ingredient.spinach, Ingredient.tomatoSauce])
    }
}
