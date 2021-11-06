//
//  MapView.swift
//  RestaurApp
//
//  Created by Michael Gemsa on 01.11.21.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var restaurantListVM: RestaurantListViewModel
    @EnvironmentObject var locationVM: LocationViewModel
    @State var region: MKCoordinateRegion
    @State private var showTitle: Bool = false
    
    var body: some View {
        
        let annotations: [RestaurantPin] = restaurantListVM.pins
        
        VStack {
            Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: annotations) { annotation in
                MapAnnotation(coordinate: annotation.coordinate) {
                    NavigationLink {
                        RestaurantDetailView(restaurant: annotation.restaurant, region: region)
                    } label: {
                        PlaceAnnotationView(title: annotation.name, showTitle: $showTitle)
                    }
                }
            }
                .onAppear {
                    locationVM.getRegion()
                    region = locationVM.region
                }
            Toggle("Show Names", isOn: $showTitle)
                .padding()
        }
    }
}
