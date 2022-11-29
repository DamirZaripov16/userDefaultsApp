//
//  AdressesViewController.swift
//  userDefaultsApp
//
//  Created by Damirka on 29.11.2022.
//

import UIKit


struct KeyDefaults {
    static let keyCity = "city"
    static let keyStreet = "street"
    static let keyBuilding = "building"
    static let keyCorp = "corp"
    static let keyApartment = "apartment"
}

class AdressesViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var streetField: UITextField!
    @IBOutlet weak var buildingField: UITextField!
    @IBOutlet weak var corpField: UITextField!
    @IBOutlet weak var apartmentField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func saveButton(_ sender: Any) {
        
        let city = cityField.text!
        let street = streetField.text!
        let building = buildingField.text!
        let corp = corpField.text!
        let apartment = apartmentField.text!
        
        if !city.isEmpty && !street.isEmpty && !building.isEmpty && !apartment.isEmpty {
            
            Model.shared.saveAdresses(city: city, street: street, building: building, corp: corp, apartment: apartment)
            self.navigationController?.popViewController(animated: true)
        }
        
    }
}
