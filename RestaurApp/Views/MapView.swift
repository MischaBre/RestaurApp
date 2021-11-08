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
    @State var resetMapView: Bool
    @State private var showTitle: Bool = false
    
    var body: some View {
        
        let annotations: [RestaurantPin] = restaurantListVM.pins
        
        NavigationView {
            VStack {
                Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: annotations) { annotation in
                    MapAnnotation(coordinate: annotation.coordinate) {
                        NavigationLink {
                            RestaurantDetailView(
                                restaurantVM: annotation.restaurant,
                                region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: annotation.restaurant.lat, longitude: annotation.restaurant.lon), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)))
                        } label: {
                            PlaceAnnotationView(title: annotation.name, showTitle: $showTitle)
                        }
                    }
                }
                    .cornerRadius(10)
                    .onAppear {
                        if resetMapView {
                            locationVM.getRegion()
                            region = locationVM.region
                            resetMapView = false
                        }
                        restaurantListVM.makePins()

                    }
                Toggle("Namen zeigen", isOn: $showTitle)
                    .padding()
            }
            .navigationBarTitle("Karte")
            .padding()
        }
    }
}
