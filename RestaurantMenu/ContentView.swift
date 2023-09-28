//
//  ContentView.swift
//  RestaurantMenu
//
//  Created by Walter Bernal Montero on 27/09/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var mockData = MockData()
    
    var body: some View {
        VStack {
            MenuItemsView()
        }
        .environmentObject(mockData)
        .padding()
    }
}

#Preview {
    ContentView()
}
