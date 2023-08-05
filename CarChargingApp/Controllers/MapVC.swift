//
//  MapVC.swift
//  CarChargingApp
//
//  Created by Kübra Demirkaya on 4.08.2023.
//

import UIKit
import SnapKit

class MapVC: UIViewController {
    
    private lazy var buttonDetails:UIButton = {
        let button = UIButton()
        button.setTitle("Details", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.01176470588, green: 0.8549019608, blue: 0.6039215686, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 0.09803921569, green: 0.1058823529, blue: 0.1215686275, alpha: 1), for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont(name: "Exo2-Bold", size: 12)
        button.addTarget(self, action: #selector(buttonDetailsTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = #colorLiteral(red: 0.08235294118, green: 0.09803921569, blue: 0.1098039216, alpha: 1)
        
        PhoneNumberVC().setupNavigationBarAppearance()
        
        setupViews()
    }
    
    func setupViews() {
        
        self.view.addSubview(buttonDetails)
        
        setupLayout()
    }
    
    func setupLayout() {
        
        buttonDetails.snp.makeConstraints { button in
            button.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-30)
            button.leading.equalToSuperview().offset(8)
            button.trailing.equalToSuperview().offset(-8)
            button.height.equalTo(44)
        }
        
    }
    
    @objc func buttonDetailsTapped() {
        present(DetailsTableViewVC(), animated: true)
    }

}
