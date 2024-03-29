//
//  ContentView.swift
//  RestaurApp
//
//  Created by Michael Gemsa on 20.10.21.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @StateObject private var restaurantListVM = RestaurantListViewModel()
    @StateObject private var selection = Selection()
    @StateObject private var locationVM = LocationViewModel()

    var body: some View {
    
        TabView(selection: $selection.selection) {
            RestaurantListView()
                .environmentObject(restaurantListVM)
                .environmentObject(selection)
                .tabItem {
                    Label("List", systemImage: "list.dash")
                }
                .tag(1)
            MapView(region: locationVM.region, resetMapView: true)
                .environmentObject(restaurantListVM)
                .environmentObject(locationVM)
                .tabItem {
                    Label("Map", systemImage: "map")
                        
                }

                .tag(2)
            AddView(region: locationVM.region)
                .environmentObject(restaurantListVM)
                .environmentObject(selection)
                .environmentObject(locationVM)
                .tabItem {
                    Label("Add", systemImage: "plus.square")
                }
                .tag(3)
        }
        .accentColor(Color(.red))
        .onAppear {
            restaurantListVM.getAllRestaurants()
            restaurantListVM.makePins()
            UITabBar.appearance().barTintColor = .white
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
