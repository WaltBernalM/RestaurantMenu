//
//  MenuDetailsView.swift
//  RestaurantMenu
//
//  Created by Walter Bernal Montero on 27/09/23.
//

import SwiftUI

struct MenuDetailsView: View {
    private var menuItem: Data
    
    init(_ menuItem: Data) {
        self.menuItem = menuItem
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(menuItem.name).font(.largeTitle).fontWeight(.bold).padding(.leading)
            VStack(alignment: .center) {
                LittleLemonLogo()
                VStack {
                    Text("Price:").fontWeight(.bold)
                    Text(String(format: "%.2f" ,menuItem.price))
                }
                VStack {
                    Text("Ordered:").fontWeight(.bold)
                    Text(String(menuItem.ordered))
                }
                VStack {
                    Text("Ingredients:").fontWeight(.bold)
                    ForEach(menuItem.ingredients, id:\.self) { ingredient in
                        Text(ingredient)
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
        let sampleData = Data(name: "Food 5", price: 10.99, ordered: 1000, ingredients: ["spinach", "broccoli", "carrot", "pasta"])
        MenuDetailsView(sampleData)
    }
}
