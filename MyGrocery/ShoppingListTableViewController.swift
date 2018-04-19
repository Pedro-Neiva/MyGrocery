//
//  ShoppingListTableViewController.swift
//  MyGrocery
//
//  Created by Pedro Neiva Alves on 4/9/18.
//  Copyright © 2018 Pedro Neiva Alves. All rights reserved.
//

import UIKit
import CoreData

class ShoppingListTableViewController: UITableViewController, UITextFieldDelegate, AddNewItemViewDelegate {
    
    var shoppingListDataSource: ShoppingListDataSource!
    var shoppingListDataProvider: ShoppingListDataProvider!
    var managedObjectContext: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        poupulateShoppingList()
    }
    
    
    private func poupulateShoppingList() {
        
        shoppingListDataProvider = ShoppingListDataProvider(managedObjectContext: managedObjectContext)
        
        shoppingListDataSource = ShoppingListDataSource(cellIdentifier: "ShoppingListTableViewCell", tableView: tableView, shoppingListDataProvider: shoppingListDataProvider)
        
        tableView.dataSource = shoppingListDataSource
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let addNewItemView = AddNewItemView(controller: self, placeholderText: "Enter New Shopping List") { title in
            
            self.addNewShoppingList(title: title)
        }
        //addNewItemView.delegate = self
        
        return addNewItemView
        
    }
    
    func addNewItemViewDidAddNewText(text: String) {
        
        addNewShoppingList(title: text)
    }
    
    private func addNewShoppingList(title: String) {
        
        let shoppingList = NSEntityDescription.insertNewObject(forEntityName: "ShoppingList", into: managedObjectContext) as! ShoppingList
        
        shoppingList.title  = title
        try! managedObjectContext.save()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
}
