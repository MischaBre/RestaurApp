//
//  ContentView.swift
//  RestaurApp
//
//  Created by Michael Gemsa on 20.10.21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var restaurantListVM = RestaurantListViewModel()
    
    func deleteRestaurant(at offsets: IndexSet) {
        offsets.forEach { index in
            let restaurant = restaurantListVM.restaurants[index]
            restaurantListVM.delete(restaurant)
        }
        restaurantListVM.getAllRestaurants()
    }
    
    var body: some View {
        VStack {
            HStack{
                TextField("Enter Name", text: $restaurantListVM.name)
                Button("Save") {
                    restaurantListVM.save()
                    restaurantListVM.getAllRestaurants()
                }
            }

            List {
                ForEach(restaurantListVM.restaurants, id: \.id) { restaurant in
                    Text(restaurant.name)
                }.onDelete(perform: deleteRestaurant)
            }.listStyle(.inset)
            
            Spacer()
        }.padding()
        .onAppear(perform: restaurantListVM.getAllRestaurants)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
