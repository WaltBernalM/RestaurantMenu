//
//  LittleLemonLogo.swift
//  RestaurantMenu
//
//  Created by Walter Bernal Montero on 28/09/23.
//

import SwiftUI

struct LittleLemonLogo: View {
    var body: some View {
        Image("Little Lemon logo")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
            .padding()
    }
}

struct LittleLemonLogo_Previews: PreviewProvider {
    static var previews: some View {
        LittleLemonLogo()
    }
}
