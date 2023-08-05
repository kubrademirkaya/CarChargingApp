//
//  DetailsTableViewVC.swift
//  CarChargingApp
//
//  Created by Kübra Demirkaya on 5.08.2023.
//

import UIKit
import SnapKit

class DetailsTableViewVC: UIViewController {

    var chargersArray: [Charger] = [
        Charger(id: "id12345", brand: "E.ON", availability: "Busy", configuration: "AC", type: "Type 2", power: "22 kW", connector: false, idleFee: "0.00 DKK/kWh", distance: "3.5 km"),
        Charger(id: "id67890", brand: "Tesla", availability: "Available", configuration: "DC", type: "Supercharger", power: "250 kW", connector: true, idleFee: "0.10 DKK/kWh", distance: "2.2 km"),
        Charger(id: "id13579", brand: "Audi", availability: "Unavailable", configuration: "DC", type: "CCS", power: "150 kW", connector: true, idleFee: "0.05 DKK/kWh", distance: "1.8 km"),
        Charger(id: "id24680", brand: "Nissan", availability: "Available", configuration: "AC", type: "Type 1", power: "7 kW", connector: false, idleFee: "0.00 DKK/kWh", distance: "5.0 km"),
        Charger(id: "id35791", brand: "BMW", availability: "Busy", configuration: "DC", type: "CHAdeMO", power: "50 kW", connector: true, idleFee: "0.08 DKK/kWh", distance: "4.2 km"),
        Charger(id: "id46802", brand: "Charging Inc.", availability: "Available", configuration: "DC", type: "CCS", power: "350 kW", connector: true, idleFee: "0.15 DKK/kWh", distance: "7.1 km"),
        Charger(id: "id57913", brand: "Volvo", availability: "Busy", configuration: "AC", type: "Type 2", power: "11 kW", connector: false, idleFee: "0.03 DKK/kWh", distance: "1.3 km"),
        Charger(id: "id68024", brand: "Renault", availability: "Unavailable", configuration: "DC", type: "CHAdeMO", power: "50 kW", connector: true, idleFee: "0.08 DKK/kWh", distance: "2.8 km"),
        Charger(id: "id79135", brand: "Ford", availability: "Available", configuration: "AC", type: "Type 1", power: "7 kW", connector: false, idleFee: "0.00 DKK/kWh", distance: "4.5 km"),
        Charger(id: "id80246", brand: "ChargePoint", availability: "Available", configuration: "DC", type: "CCS", power: "150 kW", connector: true, idleFee: "0.06 DKK/kWh", distance: "6.3 km")]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = #colorLiteral(red: 0.229565531, green: 0.2395396829, blue: 0.2522445023, alpha: 1)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 165
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    private lazy var buttonGoMaps: UIButton = {
        let button = UIButton()
        button.setTitle("Go to Maps", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.01176470588, green: 0.8549019608, blue: 0.6039215686, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 0.09803921569, green: 0.1058823529, blue: 0.1215686275, alpha: 1), for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont(name: "Exo2-Bold", size: 12)
        button.addTarget(self, action: #selector(buttonGoMapsTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = #colorLiteral(red: 0.08235294118, green: 0.09803921569, blue: 0.1098039216, alpha: 1)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
        setupViews()
    }
    
    func setupViews() {
        
        self.view.addSubviews(tableView,
                              buttonGoMaps)
        
        setupLayout()
    }
    
    func setupLayout() {
        
        tableView.snp.makeConstraints { tableView in
            tableView.edges.equalToSuperview()
            tableView.bottom.equalTo(buttonGoMaps.snp.top).offset(-8)
        }
        
        buttonGoMaps.snp.makeConstraints { button in
            button.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-30)
            button.leading.equalTo(tableView.snp.leading)
            button.trailing.equalTo(tableView.snp.trailing)
            button.height.equalTo(44)
        }
        
    }
    
    @objc func buttonGoMapsTapped() {
        dismiss(animated: true) 
    }

}

extension DetailsTableViewVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chargersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()}
        let model = chargersArray[indexPath.row]
        cell.configure(model: model)
        
        return cell
    }

}
