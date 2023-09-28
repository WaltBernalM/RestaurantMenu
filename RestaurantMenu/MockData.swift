//
//  MockData.swift
//  RestaurantMenu
//
//  Created by Walter Bernal Montero on 27/09/23.
//

import Foundation

struct Data: Hashable {
    let name: String
    let price: Double
    let ordered: Int
    let ingredients: [String]
    init(name: String = "", price: Double = 0, ordered: Int = 0, ingredients: [String] = [""]) {
        self.name = name
        self.price = price
        self.ordered = ordered
        self.ingredients = ingredients
    }
}

func dataGenerator(title: String, quantity: Int) -> [Data] {
    var array = [Data]()
    let ingredientsPicks = ["spinach", "broccoli", "carrot", "vodka", "cyanide (kidding, is salt)", "apple", "tequila", "pineaple"]
    for i in 1...quantity {
        let randomPrice = Double.random(in: 5...20)
        let randomOrdered = Int.random(in: 1...2000)
        let randomPick = [
            ingredientsPicks[Int.random(in: 0...1)],
            ingredientsPicks[Int.random(in: 2...3)],
            ingredientsPicks[Int.random(in: 4...5)],
            ingredientsPicks[Int.random(in: 6...7)],
        ]
        array.append(Data(
            name: "\(title) \(i)", 
            price: randomPrice,
            ordered: randomOrdered,
            ingredients: randomPick
        ))
    }
    return array
}

class MockData: ObservableObject {
    let foods = dataGenerator(title: "Food", quantity: 12)
    let drinks = dataGenerator(title: "Drink", quantity: 8)
    let desserts = dataGenerator(title: "Dessert", quantity: 4)
}
