//
//  MenuDetailsView.swift
//  RestaurantMenu
//
//  Created by Walter Bernal Montero on 27/09/23.
//

import SwiftUI

struct MenuDetailsView: View {
    private var menuItem: MenuItem
    
    init(_ menuItem: MenuItem) {
        self.menuItem = menuItem
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(menuItem.title).font(.largeTitle).fontWeight(.bold).padding(.leading)
            VStack(alignment: .center) {
                LittleLemonLogo()
                VStack {
                    Text("Price:").fontWeight(.bold)
                    Text(String(format: "%.2f" ,menuItem.price))
                }
                VStack {
                    Text("Ordered:").fontWeight(.bold)
                    Text(String(menuItem.ordersCount))
                }
                VStack {
                    Text("Ingredients:").fontWeight(.bold)
                    ForEach(menuItem.ingredients, id:\.self) { ingredient in
                        Text(ingredient.rawValue)
                    }
                }
            }
        }
        // Tweak to have the content up when running from MenuItemsView
        .padding(.top, -50)
    }
}

struct MenuDetails_Previews: PreviewProvider {
    static var previews: some View {
        let sampleData = MenuItem(price: 10.99, title: "Food 1", menuCategory: MenuCategory.food, ordersCount: 105, ingredients: [Ingredient.broccoli, Ingredient.carrot, Ingredient.spinach, Ingredient.tomatoSauce])
        MenuDetailsView(sampleData)
    }
}
