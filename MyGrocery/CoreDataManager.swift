//
//  CoreDataManager.swift
//  MyGrocery
//
//  Created by Pedro Neiva Alves on 4/10/18.
//  Copyright © 2018 Pedro Neiva Alves. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    
    var managedObjectContext: NSManagedObjectContext!
    
    func initializeCoreDataStack() {
        
        guard let modelURL = Bundle.main.url(forResource: "MyGroceryDataModel", withExtension: "momd") else {
            fatalError("GrocryDataModel not found")
        }
        
        guard let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Unable to initialize ManagedObjectModel")
        }
        
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        
        let fileManager = FileManager()
        
        guard let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Unable to get documents URL")
        }
        
        let storeURL = documentsURL.appendingPathComponent("MyGrocery.sqlite")
        
        print(storeURL)
        
        try! persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        
        let type = NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType
        managedObjectContext = NSManagedObjectContext(concurrencyType: type)
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
        
    }
}
