//
//  MenuItemsView.swift
//  RestaurantMenu
//
//  Created by Walter Bernal Montero on 27/09/23.
//

import SwiftUI

struct MenuItemsView: View {
    @EnvironmentObject var mockData: MockData
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    @State private var isMenuOptionsVisible: Bool = false
    
    var body: some View {
        ZStack {
            NavigationView {
                    // Rendering of the mockData
                    ScrollView {
                        // Foods section
                        VStack(alignment: .leading) {
                            Text("Food").font(.title2)
                            LazyVGrid(columns: columns, spacing: 10) {
                                ForEach(mockData.foods, id:\.self) { food in
                                    NavigationLink(destination: MenuDetailsView(food)) {
                                        VStack {
                                            Rectangle().frame(width: 110, height: 80)
                                            Text(food.name)
                                        }
                                    }
                                    .foregroundColor(.black)
                                }
                            }
                        }
                        
                        // Drinks section
                        VStack(alignment: .leading) {
                            Text("Drinks").font(.title2)
                            LazyVGrid(columns: columns, spacing: 10) {
                                ForEach(mockData.drinks, id:\.self) { drink in
                                    NavigationLink(destination: MenuDetailsView(drink)){
                                        VStack {
                                            Rectangle().frame(width: 110, height: 80)
                                            Text(drink.name)
                                        }
                                    }
                                    .foregroundColor(.black)
                                }
                            }
                        }
                        
                        // Desserts section
                        VStack(alignment: .leading) {
                            Text("Desserts").font(.title2)
                            LazyVGrid(columns: columns, spacing: 10) {
                                ForEach(mockData.desserts, id:\.self) { dessert in
                                    NavigationLink(destination: MenuDetailsView(dessert)){
                                        VStack {
                                            Rectangle().frame(width: 110, height: 80)
                                            Text(dessert.name)
                                        }
                                    }
                                    .foregroundColor(.black)
                                }
                            }
                        }
                    }
                    .padding([.leading, .trailing])
                    .navigationBarTitle("Menu")
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
                MenuOptionsView(isVisible: $isMenuOptionsVisible)
                    .background(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.move(edge: .bottom))
                    .animation(.bouncy)
            }
        }
    }
}

struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView().environmentObject(MockData())
    }
}
