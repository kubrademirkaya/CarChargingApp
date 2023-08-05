//
//  MainTabBarController.swift
//  CarChargingApp
//
//  Created by Kübra Demirkaya on 4.08.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PhoneNumberVC().setupNavigationBarAppearance()
        UINavigationBar.appearance().prefersLargeTitles = true
        
        let appearance = UITabBar.appearance()
        
        appearance.barTintColor = #colorLiteral(red: 0.08235294118, green: 0.09803921569, blue: 0.1098039216, alpha: 1)
        appearance.tintColor = .white
        appearance.backgroundColor = #colorLiteral(red: 0.08343107253, green: 0.09850729257, blue: 0.111092411, alpha: 1)
        
        let mapVC = MapVC()
        let img = UIImage(systemName: "house")
        let selectedImg = UIImage(systemName: "house.fill")
        mapVC.tabBarItem = UITabBarItem(title: "Map", image: img, selectedImage: selectedImg)
        
        
        let detailVC = DetailsVC()
        let img2 = UIImage(systemName: "tray")
        let selected2 = UIImage(systemName: "tray.fill")
        detailVC.tabBarItem = UITabBarItem(title: "Details", image: img2, selectedImage: selected2)
        
        
        let profileVC = ProfileVC()
        let img3 = UIImage(systemName: "person")
        let selected3 = UIImage(systemName: "person.fill")
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: img3, selectedImage: selected3)
        
        
        self.viewControllers = [mapVC, detailVC, profileVC]
        
    }
    
    
}
