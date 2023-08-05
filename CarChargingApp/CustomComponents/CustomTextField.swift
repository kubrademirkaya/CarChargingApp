//
//  CustomTextField.swift
//  CarChargingApp
//
//  Created by Kübra Demirkaya on 2.08.2023.
//

import UIKit

class CustomTextField: UITextField {

    var insets:UIEdgeInsets
    

    init(insets:UIEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 12)){
        self.insets = insets
        super.init(frame: .zero)
        
        self.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.font = UIFont(name: "Exo2-Regular", size: 14)
        
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 0.8
        self.layer.cornerRadius = 10
        self.backgroundColor = #colorLiteral(red: 0.1450980392, green: 0.1490196078, blue: 0.1647058824, alpha: 1)
        self.autocorrectionType = .no
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
