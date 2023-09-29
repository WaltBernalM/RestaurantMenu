//
//  MenuViewModel.swift
//  RestaurantMenu
//
//  Created by Walter Bernal Montero on 28/09/23.
//

import Foundation

func mockDataGenerator (count: Int, menuCategory: MenuCategory) -> [MenuItem] {
    var array = [MenuItem]()
    let allIngredients = Ingredient.allCases
    let ingredientsSize = Ingredient.allCases.count - 1
    for i in 1...count {
        array.append(MenuItem(
            price: Double.random(in: 8...30),
            title: "\(menuCategory.rawValue) \(i)",
            menuCategory: menuCategory,
            ordersCount: Int.random(in: 100...2000),
            ingredients: [
                allIngredients[Int.random(in: 0...1)],
                allIngredients[Int.random(in: 2...3)],
                allIngredients[Int.random(in: 4...ingredientsSize)]
            ]
        ))
    }
    return array
}

class MenuViewModel: ObservableObject {
    var foodMenuItems: [MenuItem] = mockDataGenerator(count: 12, menuCategory: MenuCategory.Food)
    var drinkMenuItems: [MenuItem] = mockDataGenerator(count: 8, menuCategory: MenuCategory.Drink)
    var dessertMenuItems: [MenuItem] = mockDataGenerator(count: 4, menuCategory: MenuCategory.Dessert)
    
    func sortMenuItems(sortCriteria: SortCriteria) {
        if sortCriteria == .popular {
            self.foodMenuItems.sort{$0.ordersCount > $1.ordersCount}
            self.drinkMenuItems.sort{$0.ordersCount > $1.ordersCount}
            self.dessertMenuItems.sort{$0.ordersCount > $1.ordersCount}
        } else if sortCriteria == .price {
            self.foodMenuItems.sort{$0.price < $1.price}
            self.drinkMenuItems.sort{$0.price < $1.price}
            self.dessertMenuItems.sort{$0.price < $1.price}
        } else if sortCriteria == .aToZ {
            self.foodMenuItems.sort{ customSort(item1: $0, item2: $1) }
            self.drinkMenuItems.sort{ customSort(item1: $0, item2: $1) }
            self.dessertMenuItems.sort{ customSort(item1: $0, item2: $1) }
        } else {
            self.foodMenuItems.sort{ customSort(item1: $0, item2: $1) }
            self.drinkMenuItems.sort{ customSort(item1: $0, item2: $1) }
            self.dessertMenuItems.sort{ customSort(item1: $0, item2: $1) }
        }
    }
}

func customSort(item1: MenuItem, item2: MenuItem) -> Bool{
    let components1 = item1.title.components(separatedBy: " ")
    let components2 = item2.title.components(separatedBy: " ")
    if let number1 = Int(components1.last ?? ""), let number2 = Int(components2.last ?? "") {
        if components1.first == components2.first {
            return number1 < number2
        }
        return components1.first! < components2.first!
    }
    return item1.title < item2.title
}
