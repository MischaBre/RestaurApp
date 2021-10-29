//
//  RestaurantViewModel.swift
//  RestaurApp
//
//  Created by Michael Gemsa on 28.10.21.
//

import Foundation
import CoreData

class RestaurantListViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var restaurants: [RestaurantViewModel] = []
    
    func getAllRestaurants() {
        restaurants = CoreDataManager.shared.getAllRestaurants().map(RestaurantViewModel.init)
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
}
