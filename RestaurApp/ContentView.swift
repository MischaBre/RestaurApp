//
//  ContentView.swift
//  RestaurApp
//
//  Created by Michael Gemsa on 20.10.21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var restaurantVM = RestaurantListViewModel()
    
    var body: some View {
        VStack {
            HStack{
                TextField("Enter Name", text: $restaurantVM.name)
                    .padding()
                Button("Save") {
                    restaurantVM.save()
                    restaurantVM.getAllRestaurants()
                }
            }
            List(restaurantVM.restaurants, id: \.id) { restaurant in
                Text(restaurant.name)
            }
            .onAppear(perform: restaurantVM.getAllRestaurants)
            
            Spacer()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
