//
//  RestaurantViewModel.swift
//  RestaurApp
//
//  Created by Michael Gemsa on 28.10.21.
//

import Foundation
import CoreData
import MapKit

class RestaurantListViewModel: ObservableObject {

    @Published var name: String = ""
    @Published var category: String = ""
    @Published var restaurants: [RestaurantViewModel] = []
    @Published var lon: Double = 0.0
    @Published var lat: Double = 0.0
    @Published var pins: [RestaurantPin] = []
    
    func getAllRestaurants() {
        restaurants = CoreDataManager.shared.getAllRestaurants().map(RestaurantViewModel.init)
    }
    
    func makePins() {
        pins.removeAll()
        restaurants.forEach { restaurant in
            pins.append(RestaurantPin(name: restaurant.name, coordinate: CLLocationCoordinate2D(latitude: restaurant.lat, longitude: restaurant.lon), restaurant: restaurant))
        }
    }
    
    func delete(_ restaurant: RestaurantViewModel) {
        let existingRestaurant = CoreDataManager.shared.getRestaurantById(id: restaurant.id)
        if let existingRestaurant = existingRestaurant {
            CoreDataManager.shared.deleteRestaurant(restaurant: existingRestaurant)
        }
    }
    
    func save() {
        let restaurant = Restaurant(context: CoreDataManager.shared.viewContext)
        restaurant.name = name
        restaurant.category = category
        restaurant.lon = lon
        restaurant.lat = lat
        
        CoreDataManager.shared.save()
        
    }
}

struct RestaurantViewModel {
    let restaurant: Restaurant
    
    var id: NSManagedObjectID {
        return restaurant.objectID
    }
    
    var name: String {
        return restaurant.name ?? ""
    }
    
    var category: String {
        return restaurant.category ?? ""
    }
    
    var lon: Double {
        return restaurant.lon
    }
    
    var lat: Double {
        return restaurant.lat
    }
}

struct RestaurantPin: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let restaurant: RestaurantViewModel
}
