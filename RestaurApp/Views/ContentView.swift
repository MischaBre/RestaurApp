//
//  ContentView.swift
//  RestaurApp
//
//  Created by Michael Gemsa on 20.10.21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var restaurantListVM = RestaurantListViewModel()
    @StateObject private var selection = Selection()
    
    var body: some View {
    
        TabView(selection: $selection.selection) {
            RestaurantListView()
                .environmentObject(restaurantListVM)
                .environmentObject(selection)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
                .tag(1)
//            MapView()
//                .environmentObject(restaurantListVM)
//                .environmentObject(selection)
//                .tabItem {
//                    Label("Map", systemImage: "map")
//                }
//                .tag(2)
            AddView()
                .environmentObject(restaurantListVM)
                .environmentObject(selection)
                .tabItem {
                    Label("Add", systemImage: "plus.square")
                }
                .tag(3)
        }.onAppear(perform: restaurantListVM.getAllRestaurants)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
