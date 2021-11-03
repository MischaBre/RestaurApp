//
//  LocationManager.swift
//  RestaurApp
//
//  Created by Michael Gemsa on 02.11.21.
//

import Foundation
import CoreLocation
import MapKit

class LocationManager: NSObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    private var location: CLLocation = CLLocation(latitude: 0.0, longitude: 0.0)
    private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    static let shared = LocationManager()
    
    // = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 38.898150, longitude: -77.034340), span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7))
    
    private var hasSetRegion = false

    private override init() {
        
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        print("init")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let locationn = locations.last {
            location = locationn
        }
    }
    
    func getRegion() -> MKCoordinateRegion {
        region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        return region
    }
    
    func getLocation() -> CLLocation {
        return location
    }
}

class LocationViewModel: ObservableObject {
    @Published var region = LocationManager.shared.getRegion()
    
    //@Published var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 38.898150, longitude: -77.034340), span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7))
    
    func getRegion() {
        region = LocationManager.shared.getRegion()
        print(region)
    }
}
