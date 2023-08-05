//
//  ProfileVC.swift
//  CarChargingApp
//
//  Created by Kübra Demirkaya on 4.08.2023.
//

import UIKit

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        PhoneNumberVC().setupNavigationBarAppearance()
        self.view.backgroundColor = #colorLiteral(red: 0.08235294118, green: 0.09803921569, blue: 0.1098039216, alpha: 1)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
