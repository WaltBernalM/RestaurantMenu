//
//  MenuItemsView.swift
//  RestaurantMenu
//
//  Created by Walter Bernal Montero on 27/09/23.
//

import SwiftUI

struct MenuItemsView: View {
    @EnvironmentObject var menuViewModel: MenuViewModel
    @State private var isMenuOptionsVisible: Bool = false
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    @State private var selectedCategory: SelectCriteria = .all
    @State private var sortBy: SortCriteria = .null
    @State private var sortedFood: [MenuItem] = [MenuItem]()
    
    var body: some View {
        ZStack {
            NavigationView {
                    // Rendering of the MenuItems array
                    ScrollView {
                        if selectedCategory == .food || selectedCategory == .all {
                            VStack(alignment: .leading) {
                                Text("Food").font(.title2)
                                LazyVGrid(columns: columns, spacing: 10) {
                                    ForEach(menuViewModel.foodMenuItems) { food in
                                        NavigationLink(destination: MenuDetailsView(food)) {
                                            VStack {
                                                Rectangle().frame(width: 110, height: 80)
                                                Text(food.title)
                                            }
                                        }
                                        .foregroundColor(.black)
                                    }
                                }
                            }
                        }
                        if selectedCategory == .drinks || selectedCategory == .all {
                            VStack(alignment: .leading) {
                                Text("Drinks").font(.title2)
                                LazyVGrid(columns: columns, spacing: 10) {
                                    ForEach(menuViewModel.drinkMenuItems) { drink in
                                        NavigationLink(destination: MenuDetailsView(drink)) {
                                            VStack {
                                                Rectangle().frame(width: 110, height: 80)
                                                Text(drink.title)
                                            }
                                        }
                                        .foregroundColor(.black)
                                    }
                                }
                            }
                        }
                        if (selectedCategory == .desserts || selectedCategory == .all) {
                            VStack(alignment: .leading) {
                                Text("Desserts").font(.title2)
                                LazyVGrid(columns: columns, spacing: 10) {
                                    ForEach(menuViewModel.dessertMenuItems) { dessert in
                                        NavigationLink(destination: MenuDetailsView(dessert)) {
                                            VStack {
                                                Rectangle().frame(width: 110, height: 80)
                                                Text(dessert.title)
                                            }
                                        }
                                        .foregroundColor(.black)
                                    }
                                }
                            }
                        }
                    }
                    .navigationBarTitle("Menu")
                    .padding([.leading, .trailing])
                    .toolbar{
                        ToolbarItem(placement:.topBarTrailing) {
                            Button(action: {
                                isMenuOptionsVisible.toggle()
                            }){
                                Image(systemName: "slider.horizontal.3")
                                    .imageScale(.large)
                            }
                    }
                }
            }
            if isMenuOptionsVisible {
                MenuOptionsView(
                    isVisible: $isMenuOptionsVisible,
                    selectedCategory: $selectedCategory,
                    sortBy: $sortBy
                )
                    .background(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.move(edge: .bottom))
                    .animation(.default)
            }
        }
    }
}

struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView().environmentObject(MenuViewModel())
    }
}
