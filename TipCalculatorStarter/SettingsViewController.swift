//
//  SettingsViewController.swift
//  TipCalculatorStarter
//
//  Created by Student Laptop_7/19_1 on 12/24/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController{
            
    @IBOutlet weak var settingsCardView: UIView!
    @IBOutlet weak var currencyTextField: UITextField!
    
    let currencies = ["$","€","£","¥","₹","₣"]

    var pickerView = UIPickerView()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSettings()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        currencyTextField.inputView = pickerView
        currencyTextField.textAlignment = .center
    }
    
    
    func setupSettings() {
        settingsCardView.layer.cornerRadius = 8
        settingsCardView.layer.masksToBounds = true
    }
    
}
    
    
extension SettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencies.count
    }
        
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencies[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currencyTextField.text = currencies[row]
        currencyTextField.resignFirstResponder()
    }
}
    
