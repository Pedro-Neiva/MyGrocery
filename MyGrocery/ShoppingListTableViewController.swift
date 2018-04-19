//
//  ShoppingListTableViewController.swift
//  MyGrocery
//
//  Created by Pedro Neiva Alves on 4/9/18.
//  Copyright © 2018 Pedro Neiva Alves. All rights reserved.
//

import UIKit
import CoreData

class ShoppingListTableViewController: UITableViewController, UITextFieldDelegate {
    
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
        
        let addNewItemView = AddNewItemView(controller: self, placeholderText: "Enter New Grocery Item")
        
        return addNewItemView
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let shoppingList = NSEntityDescription.insertNewObject(forEntityName: "ShoppingList", into: managedObjectContext) as! ShoppingList
        
        shoppingList.title  = textField.text
        
        try! managedObjectContext.save()
        
        return textField.resignFirstResponder()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
}
