//
//  CustomTableViewCell.swift
//  CarChargingApp
//
//  Created by Kübra Demirkaya on 4.08.2023.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {

    private lazy var stackViewId:UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    private lazy var labelId:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Exo2-Bold", size: 16)
        label.textColor = .white
        label.backgroundColor = .clear
        return label
    }()
    
    private lazy var labelAvailability:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Exo2-Regular", size: 14)
        label.layer.cornerRadius = 10
        label.layer.borderWidth = 0.8
        label.textColor = .white
        label.layer.borderColor = .none
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private lazy var labelBrand:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Exo2-Regular", size: 14)
        label.textColor = .white
        label.backgroundColor = .clear
        return label
    }()
    
    private lazy var stackViewProperty:UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    private lazy var labelConfiguration:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Exo2-Regular", size: 14)
        label.textColor = .white
        label.layer.cornerRadius = 8
        label.layer.borderWidth = 1
        label.layer.borderColor = #colorLiteral(red: 0.4827794433, green: 0.5228378177, blue: 0.5478973985, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.1942654252, green: 0.2042446733, blue: 0.2169445455, alpha: 1)
        label.textAlignment = .center
        label.layer.masksToBounds = true
        return label
    }()
    
    private lazy var labelType:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Exo2-Regular", size: 14)
        label.textColor = .white
        label.layer.cornerRadius = 8
        label.layer.borderWidth = 1
        label.layer.borderColor = #colorLiteral(red: 0.4827794433, green: 0.5228378177, blue: 0.5478973985, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.1942654252, green: 0.2042446733, blue: 0.2169445455, alpha: 1)
        label.textAlignment = .center
        label.layer.masksToBounds = true
        return label
    }()
    
    private lazy var labelPower:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Exo2-Regular", size: 14)
        label.textColor = .white
        label.layer.cornerRadius = 8
        label.layer.borderWidth = 1
        label.layer.borderColor = #colorLiteral(red: 0.4827794433, green: 0.5228378177, blue: 0.5478973985, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.1942654252, green: 0.2042446733, blue: 0.2169445455, alpha: 1)
        label.textAlignment = .center
        label.layer.masksToBounds = true
        return label
    }()
    
    private lazy var labelConnector:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Exo2-Regular", size: 14)
        label.textColor = .white
        label.layer.cornerRadius = 8
        label.layer.borderWidth = 1
        label.layer.borderColor = #colorLiteral(red: 0.4827794433, green: 0.5228378177, blue: 0.5478973985, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.1942654252, green: 0.2042446733, blue: 0.2169445455, alpha: 1)
        label.textAlignment = .center
        label.layer.masksToBounds = true
        return label
    }()
    
    private lazy var stackViewLast:UIStackView = {
       let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.backgroundColor = .clear
       return stackView
    }()
    
    private lazy var labelIdleFee:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Exo2-Regular", size: 14)
        label.textColor = .white
        label.backgroundColor = .clear
        return label
    }()
    
    private lazy var labelDistance:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Exo2-Regular", size: 14)
        label.textColor = .white
        label.backgroundColor = .clear
        label.textAlignment = .right
        
//        let iconAttachment = NSTextAttachment()
//        iconAttachment.image = UIImage(systemName: "mappin.circle")
//        iconAttachment.image?.withTintColor(.white)
//        let iconString = NSAttributedString(attachment: iconAttachment)
//
//
//        var labelAttributedString = NSMutableAttributedString(attributedString: iconString)
//        labelAttributedString.append(NSAttributedString(string: " \(label.text)"))
//
//        label.attributedText = labelAttributedString
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        setupViews()
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(model: Charger) {
        labelId.text = model.id
        labelType.text = model.type
        labelBrand.text = model.brand
        labelPower.text = model.power
        labelDistance.text = model.distance
        //labelDistance.attributedText?.string = model.distance
        labelConfiguration.text = model.configuration
        labelIdleFee.text = model.idleFee
        
        if model.connector == true {
//            let iconAttachment = NSTextAttachment()
//            iconAttachment.image = UIImage(named: "batteryblock")
//            labelConnector.addSubview(iconAttachment)
            
        } else {
//            let iconAttachment = NSTextAttachment()
//            iconAttachment.image = UIImage(named: "batteryblock.slash")
        }
        
        switch model.availability {
        case "Available":
            labelAvailability.text = model.availability
            labelAvailability.backgroundColor = #colorLiteral(red: 0.2633653879, green: 0.3876954317, blue: 0.815544188, alpha: 1)
        case "Busy":
            labelAvailability.text = model.availability
            labelAvailability.backgroundColor = #colorLiteral(red: 0.8442729115, green: 0.1653549969, blue: 0.1420259774, alpha: 1)
        case "Unavailable":
            labelAvailability.text = model.availability
            labelAvailability.backgroundColor = #colorLiteral(red: 0.4827794433, green: 0.5228378177, blue: 0.5478973985, alpha: 1)
        default:
            break
//            labelAvailability.text = model.availability
//            labelAvailability.backgroundColor = #colorLiteral(red: 0.1942654252, green: 0.2042446733, blue: 0.2169445455, alpha: 1)
        }
        
    }
    
//    override func prepareForReuse() {
//
//    }
    
    func setupViews() {
        
        self.contentView.backgroundColor = #colorLiteral(red: 0.08235294118, green: 0.09803921569, blue: 0.1098039216, alpha: 1)
        
        stackViewId.addArrangedSubview(labelId)
        stackViewId.addArrangedSubview(labelAvailability)
        
        stackViewProperty.addArrangedSubview(labelConfiguration)
        stackViewProperty.addArrangedSubview(labelType)
        stackViewProperty.addArrangedSubview(labelPower)
        stackViewProperty.addArrangedSubview(labelConnector)
        
        stackViewLast.addArrangedSubview(labelIdleFee)
        stackViewLast.addArrangedSubview(labelDistance)
        
        self.contentView.addSubviews(stackViewId,
                                     labelBrand,
                                     stackViewProperty,
                                     stackViewLast)
        
        setupLayout()
    }
    
    func setupLayout() {
        
        stackViewId.snp.makeConstraints { stackView in
            stackView.top.equalTo(self.contentView.safeAreaLayoutGuide.snp.top).offset(16)
            stackView.leading.equalToSuperview().offset(16)
            stackView.trailing.equalToSuperview().offset(-16)
        }
        
        labelAvailability.snp.makeConstraints { label in
            label.height.equalTo(28)
            label.width.equalTo(100)
        }
        
        labelBrand.snp.makeConstraints { label in
            label.top.equalTo(stackViewId.snp.bottom).offset(4)
            label.leading.equalTo(stackViewId.snp.leading)
            label.trailing.equalTo(stackViewId.snp.trailing)
        }
        
        stackViewProperty.snp.makeConstraints { stackView in
            stackView.top.equalTo(labelBrand.snp.bottom).offset(8)
            stackView.leading.equalTo(labelBrand.snp.leading)
            stackView.trailing.equalTo(labelBrand.snp.trailing)
        }
        
        labelType.snp.makeConstraints { label in
            label.height.equalTo(28)
        }
        
        labelPower.snp.makeConstraints { label in
            label.height.equalTo(28)
        }
        
        labelConfiguration.snp.makeConstraints { label in
            label.height.equalTo(28)
        }
        
        labelConnector.snp.makeConstraints { label in
            label.height.equalTo(28)
        }
        
        stackViewLast.snp.makeConstraints { stackView in
            stackView.top.equalTo(stackViewProperty.snp.bottom).offset(8)
            stackView.leading.equalTo(stackViewProperty.snp.leading)
            stackView.trailing.equalTo(stackViewProperty.snp.trailing)
            stackView.bottom.equalTo(self.contentView.safeAreaLayoutGuide.snp.bottom).offset(-16)
        }
        
        labelDistance.snp.makeConstraints { label in
            label.height.equalTo(28)
        }
        
    }
    


}
