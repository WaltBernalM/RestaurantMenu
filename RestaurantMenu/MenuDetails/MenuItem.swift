//
//  MenuItem.swift
//  RestaurantMenu
//
//  Created by Walter Bernal Montero on 28/09/23.
//

import Foundation

struct MenuItem: MenuItemProtocol {
    let id = UUID()
    var price: Double
    var title: String
    var menuCategory: MenuCategory
    var ordersCount: Int
    var ingredients: [Ingredient]
    
    init(
        price: Double = 0,
        title: String = "",
        menuCategory: MenuCategory = .food,
        ordersCount: Int = 0,
        ingredients: [Ingredient] = [.carrot]
    ) {
        self.price = price
        self.title = title
        self.menuCategory = menuCategory
        self.ordersCount = ordersCount
        self.ingredients = ingredients
    }
}
