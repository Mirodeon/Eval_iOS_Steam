//
//  DataManager.swift
//  Eval_iOS_Steam
//
//  Created by Student07 on 25/10/2023.
//

import Foundation
import CoreData

class DataManager {
    static let shared = DataManager()
    let context: NSManagedObjectContext
    
    init() {
        self.context = DataManager.getContext()
    }
    
    private static func getContext() -> NSManagedObjectContext {
        let container = NSPersistentContainer(name: "Eval_iOS_Steam")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })

        return container.viewContext
    }

    func saveContext() {
        guard context.hasChanges else { return }
        
        do {
            try context.save()
        } catch {
            context.rollback()
            print("Error saving context", error)
        }
    }
    
    func fetch<T>(_ request: NSFetchRequest<T>) -> [T]? {
        do {
            let result = try context.fetch(request)
            return result
        } catch {
            print("Could not fetch.", error)
            return nil
        }
    }
    
    func performFetch<T>(_ resultsController: NSFetchedResultsController<T>) {
        do {
            try resultsController.performFetch()
        } catch {
            print("Error fetching initial data", error)
        }
    }
}
