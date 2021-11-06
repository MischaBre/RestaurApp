//
//  LocationViewModel.swift
//  RestaurApp
//
//  Created by Michael Gemsa on 06.11.21.
//

import Foundation

class LocationViewModel: ObservableObject {
    @Published var region = LocationManager.shared.getRegion()
    
    //@Published var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 38.898150, longitude: -77.034340), span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7))
    
    func getRegion() {
        region = LocationManager.shared.getRegion()
        print(region)
    }
}
