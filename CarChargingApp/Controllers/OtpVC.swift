//
//  OtpVC.swift
//  CarChargingApp
//
//  Created by Kübra Demirkaya on 2.08.2023.
//

import UIKit
import SnapKit

class OtpVC: UIViewController, PhoneNumberDelegate {
    
    var textPhoneNumber = String()
    

    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "backgroundImage")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var labelDesc:UILabel = {
        let label = UILabel()
        label.text = "An authentecation code has been sent to"
        label.textColor = .white
        label.font = UIFont(name: "Exo2-Regular", size: 18)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var labelPhoneNumber:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.01176470588, green: 0.8549019608, blue: 0.6039215686, alpha: 1)
        label.font = UIFont(name: "Exo2-Bold", size: 18)
        label.textAlignment = .center
        label.text = textPhoneNumber
        return label
    }()
    
    private lazy var txtCode1:CustomTextField = {
        let textField = CustomTextField()
        return textField
    }()
    
    private lazy var txtCode2:CustomTextField = {
        let textField = CustomTextField()
        return textField
    }()
    
    private lazy var txtCode3:CustomTextField = {
        let textField = CustomTextField()
        return textField
    }()
    
    private lazy var txtCode4:CustomTextField = {
        let textField = CustomTextField()
        return textField
    }()
    
    private let stackViewCode: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 6
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var labelCodeSent:UILabel = {
        let label = UILabel()
        label.text = "Code sent"
        label.textColor = .white
        label.font = UIFont(name: "Exo2-Regular", size: 18)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var labelTime:UILabel = {
        let label = UILabel()
        label.text = "Resend code in 00:50"
        label.textColor = .white
        label.font = UIFont(name: "Exo2-Regular", size: 18)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var buttonSubmit:UIButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.01176470588, green: 0.8549019608, blue: 0.6039215686, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 0.09803921569, green: 0.1058823529, blue: 0.1215686275, alpha: 1), for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont(name: "Exo2-Bold", size: 12)
        button.addTarget(self, action: #selector(buttonSubmitTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        PhoneNumberVC().setupNavigationBarAppearance()
        navigationItem.title = "Verification"
        
        self.view.backgroundColor = #colorLiteral(red: 0.08235294118, green: 0.09803921569, blue: 0.1098039216, alpha: 1)
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundImage")!)
        let phoneNumberVC = PhoneNumberVC()
        phoneNumberVC.delegate = self
        phoneNumberTransfer(phoneNumber: textPhoneNumber)
        print(textPhoneNumber)
        setupViews()
    }
    
    func setupViews() {
        
        stackViewCode.addArrangedSubview(txtCode1)
        stackViewCode.addArrangedSubview(txtCode2)
        stackViewCode.addArrangedSubview(txtCode3)
        stackViewCode.addArrangedSubview(txtCode4)

        
        self.view.addSubviews(backgroundImage,
                              labelDesc,
                              labelPhoneNumber,
                              stackViewCode,
                              labelCodeSent,
                              labelTime,
                              buttonSubmit)
        
        setupLayout()
    }
    
    func setupLayout() {
        
        backgroundImage.snp.makeConstraints { image in
            image.top.equalToSuperview()
            image.leading.equalToSuperview()
            image.trailing.equalToSuperview()
            image.height.equalTo(250)
        }
        
        labelDesc.snp.makeConstraints { label in
            label.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            label.leading.equalToSuperview().offset(16)
            label.trailing.equalToSuperview().offset(-16)
            label.height.equalTo(100)
        }
        
        labelPhoneNumber.snp.makeConstraints { label in
            label.top.equalTo(labelDesc.snp.bottom).offset(20)
            label.leading.equalTo(labelDesc.snp.leading)
            label.trailing.equalTo(labelDesc.snp.trailing)
        }
        
        stackViewCode.snp.makeConstraints { stackView in
            stackView.top.equalTo(labelPhoneNumber.snp.bottom).offset(20)
            stackView.leading.equalTo(labelPhoneNumber.snp.leading)
            stackView.trailing.equalTo(labelPhoneNumber.snp.trailing)
            stackView.height.equalTo(100)
        }
        
        txtCode1.snp.makeConstraints { textField in
            textField.height.equalTo(75)
        }
        txtCode2.snp.makeConstraints { textField in
            textField.height.equalTo(75)
        }
        txtCode3.snp.makeConstraints { textField in
            textField.height.equalTo(75)
        }
        txtCode4.snp.makeConstraints { textField in
            textField.height.equalTo(75)
        }
        
        labelCodeSent.snp.makeConstraints { label in
            label.top.equalTo(stackViewCode.snp.bottom).offset(20)
            label.leading.equalTo(stackViewCode.snp.leading)
            label.trailing.equalTo(stackViewCode.snp.trailing)
            label.height.equalTo(44)
        }
        
        labelTime.snp.makeConstraints { label in
            label.top.equalTo(labelCodeSent.snp.bottom).offset(20)
            label.leading.equalTo(labelCodeSent.snp.leading)
            label.trailing.equalTo(labelCodeSent.snp.trailing)
            label.height.equalTo(44)
        }
        
        buttonSubmit.snp.makeConstraints { button in
            button.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-30)
            button.leading.equalTo(labelTime.snp.leading)
            button.trailing.equalTo(labelTime.snp.trailing)
            button.height.equalTo(44)
        }
        
    }
    
    func phoneNumberTransfer(phoneNumber: String) {
        print(phoneNumber)
        self.textPhoneNumber = phoneNumber
        print(phoneNumber)
    }
    
    @objc func buttonSubmitTapped() {
        navigationController?.pushViewController(SignUpVC(), animated: true)
    }

}

//extension OtpVC: PhoneNumberDelegate {
//
//}
