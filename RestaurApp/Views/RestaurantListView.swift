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
    @State private var searchText: String = ""
    
    func deleteRestaurant(at offsets: IndexSet) {
        offsets.forEach { index in
            let restaurant = restaurantListVM.restaurants[index]
            restaurantListVM.delete(restaurant)
        }
        restaurantListVM.getAllRestaurants()
    }
    
    init() {
        UITableView.appearance().backgroundColor = UIColor(Color.clear)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach (searchText == "" ? restaurantListVM.restaurants: restaurantListVM.restaurants.filter { $0.name.contains(searchText) || $0.category.contains(searchText)}, id: \.id) { restaurant in
                    NavigationLink {
                        RestaurantDetailView(
                            restaurantVM: restaurant,
                            region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: restaurant.lat, longitude: restaurant.lon), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)))
                    }
                    label: {
                        RestaurantListItemView(name: restaurant.name, category: restaurant.category)
                    }
                }
                .onDelete(perform: deleteRestaurant)
            }
            .background(Color.white)
            .navigationBarTitle("Meine Restaurants")
            .onAppear(perform: restaurantListVM.getAllRestaurants)
            .searchable(text: $searchText)
        }
    }
    
}
