//
//  RestaurantDetailView.swift
//  RestaurApp
//
//  Created by Michael Gemsa on 31.10.21.
//

import SwiftUI
import MapKit

struct RestaurantDetailView: View {
    
    let restaurant: RestaurantViewModel
    @State var region : MKCoordinateRegion
    
    var body: some View {
    
        let annotations: [RestaurantPin] = [RestaurantPin(name: restaurant.name, coordinate: CLLocationCoordinate2D(latitude: restaurant.lat, longitude: restaurant.lon), restaurant: restaurant)]
        
        Text(restaurant.name)
        Text(restaurant.category)
        Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: annotations) {
            MapMarker(coordinate: $0.coordinate)
        }
            .frame(height: 300)
        Text(String(restaurant.lon))
        Text(String(restaurant.lat))
    
    }
}

