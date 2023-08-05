//
//  DetailsVC.swift
//  CarChargingApp
//
//  Created by Kübra Demirkaya on 4.08.2023.
//

import UIKit

class DetailsVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        PhoneNumberVC().setupNavigationBarAppearance()
        
        self.view.backgroundColor = #colorLiteral(red: 0.08235294118, green: 0.09803921569, blue: 0.1098039216, alpha: 1)
    }
    
    
}
