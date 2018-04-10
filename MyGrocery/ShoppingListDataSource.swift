//
//  ShoppingListDataSource.swift
//  MyGrocery
//
//  Created by Pedro Neiva Alves on 4/10/18.
//  Copyright © 2018 Pedro Neiva Alves. All rights reserved.
//

import UIKit

class ShoppingListDataSource: NSObject, UITableViewDataSource {
    
    var cellIdentifier: String!
    var shoppingListDataProvider: ShoppingListDataProvider!
    
    init(cellIdentifier: String, shoppingListDataProvider: ShoppingListDataProvider) {
        self.cellIdentifier = cellIdentifier
        self.shoppingListDataProvider = shoppingListDataProvider        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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
















