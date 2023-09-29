//
//  MenuOptionsView.swift
//  RestaurantMenu
//
//  Created by Walter Bernal Montero on 27/09/23.
//

import SwiftUI

struct MenuOptionsView: View {
    @EnvironmentObject var menuViewModel: MenuViewModel
    @Binding var isVisible: Bool
    
    @Binding var selectedCategory: SelectCriteria
    @State private var selected: Int = -1
    
    @Binding var sortBy: SortCriteria
    @State private var sort: Int = -1
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                Button(action: {
                    if selected == 0 { selectedCategory = .all }
                    else if selected == 1 { selectedCategory = .food }
                    else if selected == 2 { selectedCategory = .drinks }
                    else if selected == 3 { selectedCategory = .desserts }
                    else if selected == -1 {
                        selectedCategory = selectedCategory
                    }
                    
                    if sort == 0 {
                        sortBy = .null
                        menuViewModel.sortMenuItems(sortCriteria: sortBy)
                    } else if sort == 1 {
                        sortBy = .popular
                        menuViewModel.sortMenuItems(sortCriteria: sortBy)
                    } else if sort == 2 {
                        sortBy = .price
                        menuViewModel.sortMenuItems(sortCriteria: sortBy)
                    } else {
                        menuViewModel.sortMenuItems(sortCriteria: sortBy)
                    }
                    
                    isVisible.toggle()
                }) {
                    Text("Done").fontWeight(.bold)
                }
                .padding(.trailing)
            }
            .padding(.top)
            .background(Color(red: 242/255, green: 242/255, blue: 247/255))
            HStack {
                Text("Filter")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading)
                    .padding(.bottom, 5)
                Spacer()
            }
            .background(Color(red: 242/255, green: 242/255, blue: 247/255))
            .padding(.top, -11)
            .padding(.bottom, -10)
            List {
                Section(header: Text("SELECTED CATEGORIES")) {
                    Text("Food").onTapGesture {
                        if selected != 1 { selected = 1 }
                        else { selected = 0 }
                    }
                    .listRowBackground(
                        selected == 1 || (selected == -1 && selectedCategory == .food)
                        ? Color.gray
                        : Color.white
                    )
                    Text("Drink").onTapGesture {
                        if selected != 2 { selected = 2 }
                        else { selected = 0 }
                    }
                    .listRowBackground(
                        selected == 2 || (selected == -1 && selectedCategory == .drinks)
                        ? Color.gray
                        : Color.white
                    )
                    Text("Dessert").onTapGesture {
                        if selected != 3 { selected = 3 }
                        else { selected = 0 }
                    }
                    .listRowBackground(
                        selected == 3 || (selected == -1 && selectedCategory == .desserts)
                        ? Color.gray : Color.white
                    )
                }
                Section(header: Text("SORT BY")) {
                    Text("Most Popular").onTapGesture {
                        if sort != 1 { sort = 1 }
                        else { sort = 0 }
                    }
                    .listRowBackground(
                        sort == 1 || (sort == -1 && sortBy == .popular)
                        ? Color.gray : Color.white
                    )
                    Text("Price $-$$$").onTapGesture {
                        if sort != 2 { sort = 2 }
                        else { sort = 0 }
                    }
                    .listRowBackground(
                        sort == 2 || (sort == -1 && sortBy == .price)
                        ? Color.gray : Color.white
                    )
                    
                    Text("A-Z").onTapGesture {
                        if sort != 3 { sort = 3 }
                        else { sort = 0 }
                    }
                    .listRowBackground(
                        sort == 3 || (sort == -1 && sortBy == .aToZ)
                        ? Color.gray : Color.white
                    )
                }
            }
            .listStyle(.grouped)
        }
        .clipShape(.rect(cornerRadius: 20))
        .padding(.top, 20)
    }
}

struct MenuOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuOptionsView(
            isVisible: .constant(true),
            selectedCategory: .constant(.all),
            sortBy: .constant(.aToZ)
        )
    }
}
