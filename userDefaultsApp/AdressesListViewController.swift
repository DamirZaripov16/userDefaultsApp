//
//  AdressesListViewController.swift
//  userDefaultsApp
//
//  Created by Damirka on 29.11.2022.
//

import UIKit

class AdressesListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView?.delegate = self
            tableView?.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
}


extension AdressesListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Model.shared.addresses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        
        if let someCell = tableView.dequeueReusableCell(withIdentifier: "someCell") {
            cell = someCell
        }
        else {
            cell = UITableViewCell()
        }
        
        cell.textLabel!.text = Model.shared.addresses[indexPath.row].description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
