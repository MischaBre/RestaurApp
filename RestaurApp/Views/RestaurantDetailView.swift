//
//  RestaurantDetailView.swift
//  RestaurApp
//
//  Created by Michael Gemsa on 31.10.21.
//

import SwiftUI
import MapKit

struct RestaurantDetailView: View {
    
    let restaurantVM: RestaurantViewModel
    @State var region : MKCoordinateRegion
    
    var body: some View {
    
        let annotations: [RestaurantPin] = [RestaurantPin(name: restaurantVM.name, coordinate: CLLocationCoordinate2D(latitude: restaurantVM.lat, longitude: restaurantVM.lon), restaurant: restaurantVM)]
        
        VStack(alignment: .leading, spacing: 10) {
            ZStack(alignment: .bottomLeading) {
                Image("Test")
                    .resizable()
                    .frame(height: 250, alignment: .center)
                    .cornerRadius(20)
                Text(restaurantVM.name)
                    .font(.largeTitle)
                    .padding(3)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.white)
                            .opacity(0.6)
                    ).padding()
            }
            Text("Kategorien: \(restaurantVM.category)")
                .frame(height: 50, alignment: .topLeading)
            Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: annotations) {
                MapMarker(coordinate: $0.coordinate)
            }
                .cornerRadius(20)
                .frame(height: 250)
                .navigationBarTitle("Infos", displayMode: .inline)
        }.padding()
        Spacer()
    }
}
