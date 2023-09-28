//
//  MenuOptionsView.swift
//  RestaurantMenu
//
//  Created by Walter Bernal Montero on 27/09/23.
//

import SwiftUI

struct MenuOptionsView: View {
    @Binding var isVisible: Bool
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                Button(action: {
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
                        // Something goes here
                    }
                    
                    Text("Drink").onTapGesture {
                        // Something goes here
                    }
                    
                    Text("Dessert").onTapGesture {
                        // Something goes here
                    }
                    
                }
                Section(header: Text("SORT BY")) {
                    Text("Most Popular").onTapGesture {
                        // Something goes here
                    }
                    
                    Text("Price $-$$$").onTapGesture {
                        // Something goes here
                    }
                    
                    Text("A-Z").onTapGesture {
                        // Something goes here
                    }
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
        MenuOptionsView(isVisible: .constant(true))
    }
}
