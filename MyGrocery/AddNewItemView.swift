//
//  AddNewItemView.swift
//  MyGrocery
//
//  Created by Pedro Neiva Alves on 4/19/18.
//  Copyright © 2018 Pedro Neiva Alves. All rights reserved.
//

import Foundation
import UIKit

protocol AddNewItemViewDelegate: class {
    
    func addNewItemViewDidAddNewText(text: String)
}

class AddNewItemView: UIView, UITextFieldDelegate {
    
    var placeholderText: String!
    weak var delegate: AddNewItemViewDelegate!
    var addNewItemViewClosure: (String) -> ()
    
    init(controller: UIViewController, placeholderText: String, addNewItemViewClosure: @escaping (String) -> ()) {
        
        self.placeholderText = placeholderText
        self.addNewItemViewClosure = addNewItemViewClosure
        
        super.init(frame: controller.view.frame)
        
        setup()
    }
    
    
    private func setup() {
        
        backgroundColor = UIColor.lightGray
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 44))
        headerView.backgroundColor = UIColor.lightText
        
        let textField = UITextField(frame: headerView.frame)
        textField.placeholder = placeholderText
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.delegate = self
        
        headerView.addSubview(textField)
        
        addSubview(headerView)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let text = textField.text!
        
        addNewItemViewClosure(text)
        
        //delegate.addNewItemViewDidAddNewText(text: text)
        
        return textField.resignFirstResponder()
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
