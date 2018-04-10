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

        //initializeCoreDataStack()
        
        poupulateShoppingList()
    }
    
    
    private func poupulateShoppingList() {
        
        shoppingListDataProvider = ShoppingListDataProvider(managedObjectContext: managedObjectContext)
        
        shoppingListDataSource = ShoppingListDataSource(cellIdentifier: "ShoppingListTableViewCell", shoppingListDataProvider: shoppingListDataProvider)
        
        tableView.dataSource = shoppingListDataSource
        
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let shoppingList = shoppingListDataProvider.objectAtIndex(at: indexPath)
            
            managedObjectContext.delete(shoppingList)
            try! managedObjectContext.save()
        }
        
        tableView.isEditing = false
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: 44))
        
        headerView.backgroundColor = UIColor.lightText
        
        let textField = UITextField(frame: headerView.frame)
        textField.placeholder = "Enter Shopping List"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.delegate = self
        
        headerView.addSubview(textField)
        
        return headerView
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
