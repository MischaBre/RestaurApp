//
//  SwiftUIView.swift
//  RestaurApp
//
//  Created by Michael Gemsa on 31.10.21.
//

import SwiftUI
import MapKit

struct RestaurantListView: View {
    @EnvironmentObject var restaurantListVM: RestaurantListViewModel
    
    func deleteRestaurant(at offsets: IndexSet) {
        offsets.forEach { index in
            let restaurant = restaurantListVM.restaurants[index]
            restaurantListVM.delete(restaurant)
        }
        restaurantListVM.getAllRestaurants()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach (restaurantListVM.restaurants, id: \.id) { restaurant in
                    NavigationLink {
                        RestaurantDetailView(
                            restaurant: restaurant,
                            region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: restaurant.lat, longitude: restaurant.lon), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)))
                        } label: {
                            Text(restaurant.name)
                        }
                }.onDelete(perform: deleteRestaurant)
            }.onAppear(perform: restaurantListVM.getAllRestaurants)
        }
    }
    
}
