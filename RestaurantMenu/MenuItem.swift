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
}
