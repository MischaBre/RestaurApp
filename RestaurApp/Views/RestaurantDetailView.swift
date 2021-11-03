//
//  RestaurantDetailView.swift
//  RestaurApp
//
//  Created by Michael Gemsa on 31.10.21.
//

import SwiftUI
import MapKit

struct RestaurantDetailView: View {
    
    var restaurant: RestaurantViewModel
    @State var region : MKCoordinateRegion
    
    
    var body: some View {
    
        Text(restaurant.name)
        Text(restaurant.category)
        Map(coordinateRegion: $region, showsUserLocation: true)
            .frame(height: 300)
        Text(String(restaurant.lon))
        Text(String(restaurant.lat))
    
    }
}

