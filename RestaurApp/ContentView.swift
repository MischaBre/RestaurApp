//
//  ContentView.swift
//  RestaurApp
//
//  Created by Michael Gemsa on 20.10.21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var restaurantListVM = RestaurantListViewModel()
    
    var body: some View {
    
        TabView {
            RestaurantListView()
                .environmentObject(restaurantListVM)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            
        }.onAppear(perform: restaurantListVM.getAllRestaurants)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
