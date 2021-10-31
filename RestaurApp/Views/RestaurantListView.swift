//
//  SwiftUIView.swift
//  RestaurApp
//
//  Created by Michael Gemsa on 31.10.21.
//

import SwiftUI

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
                    NavigationLink(
                        destination: RestaurantDetailView(restaurant: restaurant),
                        label: {
                            Text(restaurant.name)
                        })
                }.onDelete(perform: deleteRestaurant)
            }.onAppear(perform: restaurantListVM.getAllRestaurants)
        }
    }
    
}
