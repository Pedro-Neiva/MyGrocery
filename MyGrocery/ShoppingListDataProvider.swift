//
//  ShoppingListDataProvider.swift
//  MyGrocery
//
//  Created by Pedro Neiva Alves on 4/10/18.
//  Copyright © 2018 Pedro Neiva Alves. All rights reserved.
//

import Foundation
import CoreData

class ShoppingListDataProvider: NSObject, NSFetchedResultsControllerDelegate {
    
    var fetchedResultsController: NSFetchedResultsController<ShoppingList>!
    
    init(managedObjectContext: NSManagedObjectContext) {
        
        let request = NSFetchRequest<ShoppingList>(entityName: "ShoppingList")
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        super.init()
        fetchedResultsController.delegate = self
        try! fetchedResultsController.performFetch()
    }
    
    var sections: [NSFetchedResultsSectionInfo]? {
        get {
            return fetchedResultsController.sections
        }
    }
    
    func objectAtIndex(at indexPath: IndexPath) -> ShoppingList {
        
        return fetchedResultsController.object(at: indexPath)
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        
    }
    
    
}














