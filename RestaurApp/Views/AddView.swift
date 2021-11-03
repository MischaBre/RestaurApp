//
//  AddView.swift
//  RestaurApp
//
//  Created by Michael Gemsa on 31.10.21.
//

import SwiftUI
import MapKit

struct AddView: View {
    
    @EnvironmentObject var restaurantListVM: RestaurantListViewModel
    @EnvironmentObject var selection: Selection
    @EnvironmentObject var locationVM: LocationViewModel
    
    @State var region: MKCoordinateRegion
    
    var body: some View {
        
        VStack {
            HStack {
                Button("Abbrechen") {
                    restaurantListVM.name = ""
                    selection.selection = 1
                }
                .foregroundColor(.red)
                .padding()
                Spacer()
                Button("Save") {
                    restaurantListVM.lat = $region.center.latitude.wrappedValue
                    restaurantListVM.lon = $region.center.longitude.wrappedValue
                    restaurantListVM.save()
                    restaurantListVM.name = ""
                    restaurantListVM.category = ""
                    restaurantListVM.lat = 0.0
                    restaurantListVM.lon = 0.0
                    selection.selection = 1
                }.padding()
            }
            
            TextField("Name", text: $restaurantListVM.name)
                .textFieldStyle(.roundedBorder)
            TextField("Kategorie", text: $restaurantListVM.category)
                .textFieldStyle(.roundedBorder)
            
            ZStack {
                
                Map(coordinateRegion: $region, showsUserLocation: true)
                    .onAppear {
                        locationVM.getRegion()
                        region = locationVM.region
                    }
                    .frame(height: 300)
                    .overlay(
                        Image(systemName: "circle")
                    )
            }
            Spacer()
        }.padding()
    }
}
