//
//  RestaurantListItemView.swift
//  RestaurApp
//
//  Created by Michael Gemsa on 06.11.21.
//

import SwiftUI

struct RestaurantListItemView: View {
    let name: String
    let category: String
    
    var body: some View {
        HStack {
            Image("Test")
                .resizable()
                .frame(width: 60, height: 60, alignment: .center)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title)
                Text(category)
                    .font(.footnote)
            }
            
        }
    }
}

struct RestaurantListItemView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListItemView(name: "Bluadadaffafb", category: "blub")
    }
}
