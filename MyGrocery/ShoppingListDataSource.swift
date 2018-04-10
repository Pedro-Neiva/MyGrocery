//
//  ShoppingListDataSource.swift
//  MyGrocery
//
//  Created by Pedro Neiva Alves on 4/10/18.
//  Copyright © 2018 Pedro Neiva Alves. All rights reserved.
//

import UIKit

class ShoppingListDataSource: NSObject, UITableViewDataSource, ShoppingListDataProviderDelegate {
    
    var cellIdentifier: String!
    var tableView: UITableView!
    var shoppingListDataProvider: ShoppingListDataProvider!
    
    init(cellIdentifier: String, tableView: UITableView, shoppingListDataProvider: ShoppingListDataProvider) {
        self.cellIdentifier = cellIdentifier
        self.tableView = tableView
        self.shoppingListDataProvider = shoppingListDataProvider
        
        super.init()
        shoppingListDataProvider.delegate = self
    }
    
    func shoppingListDataProviderDidInsert(indexPath: IndexPath) {
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            let shoppingList = shoppingListDataProvider.objectAtIndex(at: indexPath)
            
            shoppingListDataProvider.delete(shoppingList: shoppingList)
        }
        
        tableView.isEditing = false
    }
    
    func shoppingListDataProviderDidDelete(indexPath: IndexPath) {
        
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let sections = shoppingListDataProvider.sections else {
            return 1
        }
        
        return sections[section].numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let shoppingList = shoppingListDataProvider.objectAtIndex(at: indexPath)
        cell.textLabel?.text = shoppingList.title
        
        return cell
    }
}
















