//
//  RestaurantViewModel.swift
//  RestaurApp
//
//  Created by Michael Gemsa on 28.10.21.
//

import Foundation
import CoreData

class RestaurantListViewModel: ObservableObject {
    
    var name: String = ""
    @Published var restaurants: [RestaurantViewModel] = []
    
    func getAllRestaurants() {
        restaurants = CoreDataManager.shared.getAllRestaurants().map(RestaurantViewModel.init)
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
