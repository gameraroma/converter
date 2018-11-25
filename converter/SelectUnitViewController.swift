//
//  SelectUnitViewController.swift
//  converter
//
//  Created by Chakpiwat Pacharajindawat on 20/11/2561 BE.
//  Copyright © 2561 Chakpiwat. All rights reserved.
//

import UIKit

class SelectUnitViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // MARK: properties
    public var barTitle: String?
    public var selectedUnit: Unit?
    
    public var unitList = [Dimension]()
    
    // MARK: outlet properties
    @IBOutlet weak var unitsListTableView: UITableView!
    @IBOutlet weak var navItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navItem.title = barTitle
        
        unitsListTableView.tableFooterView = UIView()
        
        unitsListTableView.dataSource = self
        unitsListTableView.delegate = self
    }
    
    // MARK: actions
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return unitList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .long
        let unit = formatter.string(from: unitList[indexPath.row]) + " (\(unitList[indexPath.row].symbol))"
        
        cell.textLabel?.text = unit
        cell.selectionStyle = .blue
        
        if selectedUnit == unitList[indexPath.row] {
            cell.setSelected(true, animated: true)
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedUnit = unitList[indexPath.row]
        super.performSegue(withIdentifier: "unitSelected", sender: self)
    }
}
