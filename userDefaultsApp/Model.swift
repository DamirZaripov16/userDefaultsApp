//
//  Model.swift
//  userDefaultsApp
//
//  Created by Damirka on 29.11.2022.
//

import Foundation

class Model {
    
    let defaults = UserDefaults.standard
    
    static let shared = Model()
    
    struct UserAddress: Codable {
        var city: String
        var street: String
        var building: String
        var corp: String?
        var apartment: String
        var description: String {
            return "\(city), \(street), \(building), \(corp ?? ""), \(apartment) "
        }
    }
    
    var addresses: [UserAddress] {
        
        get {
            
            if let data = defaults.value(forKey: "addresses") as? Data {
                return try! PropertyListDecoder().decode([UserAddress].self, from: data)
            }
            else {
                return [UserAddress]()
            }
        }
        set {
            
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: "addresses")
            }
        }
    }
    func saveAdresses(city: String, street: String, building: String, corp: String?, apartment: String) {
        let address = UserAddress(city: city, street: street, building: building, corp: corp, apartment: apartment)
        addresses.insert(address, at: 0)
    }
}
