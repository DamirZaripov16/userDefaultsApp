//
//  TableViewController.swift
//  userDefaultsApp
//
//  Created by Damirka on 27.11.2022.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var isToggled: UISwitch!
    @IBOutlet weak var sexSwitch: UISegmentedControl!
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = userDefaults.object(forKey: "name") {
            nameTextField.text = name as? String
        }
        
        if let lastName = userDefaults.object(forKey: "last name") {
            lastNameTextField.text = lastName as? String
        }
        
        if let isSwitch = userDefaults.object(forKey: "switch") {
            isToggled.isOn = isSwitch as! Bool
        }
        
        if let sex = userDefaults.object(forKey: "segment") {
            sexSwitch.selectedSegmentIndex = sex as! Int
        }
        

    }
    @IBAction func saveButton(_ sender: UIButton) {
        
        userDefaults.setValue(nameTextField.text, forKey: "name")
        userDefaults.setValue(lastNameTextField.text, forKey: "last name")
        userDefaults.set(isToggled.isOn, forKey: "switch")
        userDefaults.set(sexSwitch.selectedSegmentIndex, forKey: "segment")
        
        print("Saved")
        
        lastNameTextField.resignFirstResponder()
    }
    
}
