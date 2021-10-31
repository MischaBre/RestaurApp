//
//  RestaurantDetailView.swift
//  RestaurApp
//
//  Created by Michael Gemsa on 31.10.21.
//

import SwiftUI

struct RestaurantDetailView: View {
    var restaurant: RestaurantViewModel
    
    var body: some View {
        Text(restaurant.name)
        Text(restaurant.category)
    }
}

