//
//  PhoneNumberVC.swift
//  CarChargingApp
//
//  Created by Kübra Demirkaya on 2.08.2023.
//

import UIKit
import SnapKit

protocol PhoneNumberDelegate: AnyObject {
    func phoneNumberTransfer(phoneNumber: String)
}

class PhoneNumberVC: UIViewController {
    
    weak var delegate: PhoneNumberDelegate?
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "backgroundImage")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var labelWelcome:UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.textColor = .white
        label.font = UIFont(name: "Exo2-Bold", size: 36)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var labelDesc:UILabel = {
        let label = UILabel()
        label.text = "Enter your phone number to get started"
        label.textColor = .white
        label.font = UIFont(name: "Exo2-Regular", size: 18)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var textPhoneNumber:CustomTextField = {
        let textField = CustomTextField()
        //textField.placeholder = "Phone Number"
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    private lazy var labelPolicy:UILabel = {
        let label = UILabel()
        label.text = "I agree with privacy policy agreement"
        label.textColor = .white
        label.font = UIFont(name: "Exo2-Regular", size: 12)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var buttonContinue:UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.01176470588, green: 0.8549019608, blue: 0.6039215686, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 0.09803921569, green: 0.1058823529, blue: 0.1215686275, alpha: 1), for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont(name: "Exo2-Bold", size: 12)
        button.addTarget(self, action: #selector(buttonContinueTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarAppearance()
        
        self.view.backgroundColor = #colorLiteral(red: 0.08235294118, green: 0.09803921569, blue: 0.1098039216, alpha: 1)
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundImage")!)
        
        setupViews()
    }
    
    public func setupNavigationBarAppearance() {
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.titleTextAttributes = [.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        appearance.largeTitleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.08235294118, green: 0.09803921569, blue: 0.1098039216, alpha: 1)]
        
        appearance.buttonAppearance.normal.titleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.08235294118, green: 0.09803921569, blue: 0.1098039216, alpha: 1)]
    
        let backArrowImage = UIImage(systemName: "back_arrow_icon")?.withTintColor(.white)
        appearance.setBackIndicatorImage(backArrowImage, transitionMaskImage: backArrowImage)
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationItem.backButtonTitle = " "
        
    }
    
    func setupViews() {
        
        self.view.addSubviews(backgroundImage,
                              labelWelcome,
                              labelDesc,
                              textPhoneNumber,
                              labelPolicy,
                              buttonContinue)
        
        setupLayout()
    }
    
    func setupLayout() {
        
        backgroundImage.snp.makeConstraints { image in
            image.top.equalToSuperview()
            image.leading.equalToSuperview()
            image.trailing.equalToSuperview()
            image.height.equalTo(250)
        }
        
        labelWelcome.snp.makeConstraints { label in
            label.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            label.leading.equalToSuperview().offset(16)
            label.trailing.equalToSuperview().offset(-16)
            label.height.equalTo(100)
        }
        
        labelDesc.snp.makeConstraints { label in
            label.top.equalTo(labelWelcome.snp.bottom).offset(20)
            label.leading.equalTo(labelWelcome.snp.leading)
            label.trailing.equalTo(labelWelcome.snp.trailing)
        }
        
        textPhoneNumber.snp.makeConstraints { textField in
            textField.top.equalTo(labelDesc.snp.bottom).offset(20)
            textField.leading.equalTo(labelDesc.snp.leading)
            textField.trailing.equalTo(labelDesc.snp.trailing)
            textField.height.equalTo(44)
        }
        
        labelPolicy.snp.makeConstraints { label in
            label.top.equalTo(textPhoneNumber.snp.bottom).offset(20)
            label.leading.equalTo(textPhoneNumber.snp.leading)
            label.trailing.equalTo(textPhoneNumber.snp.trailing)
            label.height.equalTo(44)
        }
        
        
        buttonContinue.snp.makeConstraints { button in
            button.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-30)
            button.leading.equalTo(labelPolicy.snp.leading)
            button.trailing.equalTo(labelPolicy.snp.trailing)
            button.height.equalTo(44)
        }
        
    }
    
    @objc func buttonContinueTapped() {
        
        guard let textPhoneNumber = textPhoneNumber.text else {return}
        
        let OtpVC =  OtpVC()
        OtpVC.textPhoneNumber = textPhoneNumber
        
        navigationController?.pushViewController(OtpVC, animated: true)
        
    }
    
    @objc func textFieldDidChange() {
        //print(textPhoneNumber.text)
        if let textPhoneNumber = textPhoneNumber.text {
            delegate?.phoneNumberTransfer(phoneNumber: textPhoneNumber)
            //print(textPhoneNumber)
        }
    }
    
 
}

extension String {
    func applyPatternOnNumbers(pattern: String, replacementCharacter: Character) -> String {
        var pureNumber = self.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else { return pureNumber }
            let stringIndex = String.Index(utf16Offset: index, in: pattern)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacementCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        return pureNumber
    }
}

//extension PhoneNumberVC: UITextFieldDelegate {
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        //guard let text = textField.text else { return }
//        textField.text = text.applyPatternOnNumbers(pattern: "+# (###) ###-####", replacementCharacter: "#")
//        return true
//    }
//}



