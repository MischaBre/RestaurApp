//
//  MapView.swift
//  RestaurApp
//
//  Created by Michael Gemsa on 01.11.21.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var locationVM: LocationViewModel
    @State var region: MKCoordinateRegion
    
    var body: some View {
        
        Map(coordinateRegion: $region, showsUserLocation: true)
            .onAppear {
                locationVM.getRegion()
                region = locationVM.region
            }
    }
}
