//
//  AddNewItemView.swift
//  MyGrocery
//
//  Created by Pedro Neiva Alves on 4/19/18.
//  Copyright © 2018 Pedro Neiva Alves. All rights reserved.
//

import Foundation
import UIKit

class AddNewItemView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    
    private func setup() {
        
        backgroundColor = UIColor.lightGray
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 44))
        headerView.backgroundColor = UIColor.lightText
        
        let textField = UITextField(frame: headerView.frame)
        textField.placeholder = "Enter Shopping List"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        //textField.delegate = self
        
        headerView.addSubview(textField)
        
        addSubview(headerView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
