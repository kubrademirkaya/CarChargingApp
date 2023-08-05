//
//  SignUpVC.swift
//  CarChargingApp
//
//  Created by Kübra Demirkaya on 2.08.2023.
//

import UIKit

struct City {
    var name: String
    var states:[String]
}

class SignUpVC: UIViewController {
    
    var data:[City] = [City(name: "Ankara", states: ["Mamak","Kızılay","Çankaya"]),
                       City(name: "İstanbul", states: ["Kadıköy","Sarıyer","Bakırköy"])]
    
    var selectedPickerItem = Int()
    
    //let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: SignUpVC.self, action: #selector(doneButtonTapped))
        
    let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "backgroundImage")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var labelSignUp:UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.textColor = .white
        label.font = UIFont(name: "Exo2-Bold", size: 36)
        label.textAlignment = .center
        return label
    }()
    
    private let stackViewName: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var labelName:UILabel = {
        let label = UILabel()
        label.text = "Name:"
        label.font = UIFont(name: "Exo2-Regular", size: 12)
        label.textColor = .white
        return label
    }()
    
    private lazy var textName:CustomTextField = {
        let textField = CustomTextField()
        
        return textField
    }()
    
    private let stackViewSurname: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var labelSurname:UILabel = {
        let label = UILabel()
        label.text = "Surname:"
        label.font = UIFont(name: "Exo2-Regular", size: 12)
        label.textColor = .white
        return label
    }()
    
    private lazy var textSurname:CustomTextField = {
        let textField = CustomTextField()
        
        return textField
    }()
    
    private let stackViewUserName: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var labelUsername:UILabel = {
        let label = UILabel()
        label.text = "Username:"
        label.font = UIFont(name: "Exo2-Regular", size: 12)
        label.textColor = .white
        return label
    }()
    
    private lazy var textUsername:CustomTextField = {
        let textField = CustomTextField()
        
        return textField
    }()
    
    private let stackViewCity: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var labelCity:UILabel = {
        let label = UILabel()
        label.text = "City:"
        label.font = UIFont(name: "Exo2-Regular", size: 12)
        label.textColor = .white
        return label
    }()
    
    private lazy var pickerCity:UIPickerView = {
        let picker = UIPickerView()
        //picker.backgroundColor = .white
        picker.dataSource = self
        picker.delegate = self
        return picker
    }()
    
    private lazy var textCity:CustomTextField = {
        let textField = CustomTextField()
        textField.inputView = pickerCity
        //textField.inputAccessoryView = addToolBar()
        return textField
    }()
    
    private let stackViewState: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var labelState:UILabel = {
        let label = UILabel()
        label.text = "State:"
        label.font = UIFont(name: "Exo2-Regular", size: 12)
        label.textColor = .white
        return label
    }()
    
    private lazy var pickerState:UIPickerView = {
        let picker = UIPickerView()
        //picker.backgroundColor = .white
        picker.dataSource = self
        picker.delegate = self
        return picker
    }()
    
    private lazy var textState:CustomTextField = {
        let textField = CustomTextField()
        textField.inputView = pickerState
        //textField.inputAccessoryView = addToolBar()
        return textField
    }()
    
    private let stackViewPassword: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var labelPassword:UILabel = {
        let label = UILabel()
        label.text = "Password:"
        label.font = UIFont(name: "Exo2-Regular", size: 12)
        label.textColor = .white
        return label
    }()
    
    private lazy var textPassword:CustomTextField = {
        let textField = CustomTextField()
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let stackViewPasswordValidation: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.alignment = .leading
        return stackView
    }()
    
    private lazy var labelValidation:UILabel = {
        let label = UILabel()
        label.text = "Password Validation:"
        label.font = UIFont(name: "Exo2-Regular", size: 12)
        label.textColor = .white
        return label
    }()
    
    private lazy var textPasswordValidation:CustomTextField = {
        let textField = CustomTextField()
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var buttonSignUp: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.01176470588, green: 0.8549019608, blue: 0.6039215686, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 0.09803921569, green: 0.1058823529, blue: 0.1215686275, alpha: 1), for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont(name: "Exo2-Bold", size: 12)
        button.addTarget(self, action: #selector(buttonSignUpTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        PhoneNumberVC().setupNavigationBarAppearance()

        self.view.backgroundColor = #colorLiteral(red: 0.08235294118, green: 0.09803921569, blue: 0.1098039216, alpha: 1)
        
        setupViews()
        
    }
    
    func setupViews() {
        
        stackViewName.addArrangedSubview(labelName)
        stackViewName.addArrangedSubview(textName)
        
        stackViewSurname.addArrangedSubview(labelSurname)
        stackViewSurname.addArrangedSubview(textSurname)
        
        stackViewUserName.addArrangedSubview(labelUsername)
        stackViewUserName.addArrangedSubview(textUsername)
        
        stackViewCity.addArrangedSubview(labelCity)
        stackViewCity.addArrangedSubview(textCity)
        
        stackViewState.addArrangedSubview(labelState)
        stackViewState.addArrangedSubview(textState)
        
        stackViewPassword.addArrangedSubview(labelPassword)
        stackViewPassword.addArrangedSubview(textPassword)
        
        stackViewPasswordValidation.addArrangedSubview(labelValidation)
        stackViewPasswordValidation.addArrangedSubview(textPasswordValidation)
        
        self.view.addSubviews(backgroundImage,
                              labelSignUp,
                              stackViewName,
                              stackViewSurname,
                              stackViewUserName,
                              stackViewCity,
                              stackViewState,
                              stackViewPassword,
                              stackViewPasswordValidation,
                              buttonSignUp)
        
        setupLayout()
    }
    
    func setupLayout() {
        
        backgroundImage.snp.makeConstraints { image in
            image.top.equalToSuperview()
            image.leading.equalToSuperview()
            image.trailing.equalToSuperview()
            image.height.equalTo(250)
        }

        labelSignUp.snp.makeConstraints { label in
            label.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            label.leading.equalToSuperview().offset(16)
            label.trailing.equalToSuperview().offset(-16)
            label.height.equalTo(44)
        }

        stackViewName.snp.makeConstraints { stackView in
            stackView.top.equalTo(labelSignUp.snp.bottom).offset(6)
            stackView.leading.equalTo(labelSignUp.snp.leading)
            stackView.trailing.equalTo(labelSignUp.snp.trailing)
        }
        
        labelName.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
        }
        
        textName.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(44)
        }
        
        stackViewSurname.snp.makeConstraints { textField in
            textField.top.equalTo(stackViewName.snp.bottom).offset(6)
            textField.leading.equalTo(stackViewName.snp.leading)
            textField.trailing.equalTo(stackViewName.snp.trailing)
        }
        
        labelSurname.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
        }
        
        textSurname.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(44)
        }
        
        stackViewUserName.snp.makeConstraints { textField in
            textField.top.equalTo(stackViewSurname.snp.bottom).offset(6)
            textField.leading.equalTo(stackViewSurname.snp.leading)
            textField.trailing.equalTo(stackViewSurname.snp.trailing)
        }
        
//        pickerCity.snp.makeConstraints { picker in
//            picker.top.equalTo(textUsername.snp.bottom).offset(20)
//            picker.leading.equalTo(textUsername.snp.leading)
//            picker.trailing.equalTo(textUsername.snp.trailing)
//            //picker.height.equalTo(44)
//        }
        
        labelUsername.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
        }
        
        textUsername.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(44)
        }
        
        stackViewCity.snp.makeConstraints { textField in
            textField.top.equalTo(stackViewUserName.snp.bottom).offset(6)
            textField.leading.equalTo(stackViewUserName.snp.leading)
            textField.trailing.equalTo(stackViewUserName.snp.trailing)
        }
        
        labelCity.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
        }
        
        textCity.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(44)
        }
        
        stackViewState.snp.makeConstraints { textField in
            textField.top.equalTo(stackViewCity.snp.bottom).offset(6)
            textField.leading.equalTo(stackViewCity.snp.leading)
            textField.trailing.equalTo(stackViewCity.snp.trailing)
        }
        
        labelState.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
        }
        
        textState.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(44)
        }
        
        stackViewPassword.snp.makeConstraints { textField in
            textField.top.equalTo(stackViewState.snp.bottom).offset(6)
            textField.leading.equalTo(stackViewState.snp.leading)
            textField.trailing.equalTo(stackViewState.snp.trailing)
        }
        
        labelPassword.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
        }
        
        textPassword.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(44)
        }
        
        stackViewPasswordValidation.snp.makeConstraints { textField in
            textField.top.equalTo(stackViewPassword.snp.bottom).offset(6)
            textField.leading.equalTo(stackViewPassword.snp.leading)
            textField.trailing.equalTo(stackViewPassword.snp.trailing)
        }
        
        labelValidation.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
        }
        
        textPasswordValidation.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(44)
        }
        
        buttonSignUp.snp.makeConstraints { button in
            button.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            button.leading.equalTo(stackViewPasswordValidation.snp.leading)
            button.trailing.equalTo(stackViewPasswordValidation.snp.trailing)
            button.height.equalTo(44)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    @objc func buttonSignUpTapped() {
        
        navigationController?.pushViewController(MainTabBarController(), animated: true)
        
    }
    
//    @objc func doneButtonTapped() {
//
//        self.view.endEditing(true)
//    }
//
//    private func addToolBar()->UIToolbar {
//        let tb = UIToolbar()
//        tb.sizeToFit()
//        tb.setItems([space,doneButton], animated: false)
//        return tb
//    }

}

extension SignUpVC:UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == pickerCity {
            return data[row].name
        }
        return data[selectedPickerItem].states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //textCity.text = source[row]
        //selectedPickerItem = source[row]
        if pickerView == pickerCity {
            textCity.text = data[row].name
            selectedPickerItem = row
        } else {
            textState.text = data[selectedPickerItem].states[row]
        }
        self.view.endEditing(true)
    }
}

extension SignUpVC:UIPickerViewDataSource {
    
  
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //return data.count
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == pickerCity {
            return data.count
        }
        
        return data[selectedPickerItem].states.count
    }
}
