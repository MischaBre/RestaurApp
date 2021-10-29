//
//  CoreDataManager.swift
//  RestaurApp
//
//  Created by Michael Gemsa on 28.10.21.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistantContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    var viewContext: NSManagedObjectContext {
        return persistantContainer.viewContext
    }
    
    func getRestaurantById(id: NSManagedObjectID) -> Restaurant? {
        do {
            return try viewContext.existingObject(with: id) as? Restaurant
        } catch {
            return nil
        }
    }
    
    func getAllRestaurants() -> [Restaurant] {
        let request: NSFetchRequest<Restaurant> = Restaurant.fetchRequest()
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    func deleteRestaurant(restaurant: Restaurant) {
        viewContext.delete(restaurant)
        save()
    }
    
    func save() {
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    private init() {
        persistantContainer = NSPersistentContainer(name: "RestaurantDataModel")
        persistantContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to initialize Core Data Stack \(error)")
            }
        }
    }
}
