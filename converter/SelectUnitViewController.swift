//
//  SelectUnitViewController.swift
//  converter
//
//  Created by Chakpiwat Pacharajindawat on 20/11/2561 BE.
//  Copyright © 2561 Chakpiwat. All rights reserved.
//

import UIKit

class SelectUnitViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    public var barTitle: String?
    public var measureName: String = ""
    public var selectedUnit: Unit?
    
    @IBOutlet weak var unitsListTableView: UITableView!
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var navItem: UINavigationItem!
    
    var unitList = [Unit]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navItem.title = barTitle
        
        if measureName == "Length" {
            unitList = AppData.lengthUnitsList
        }
        
        unitsListTableView.dataSource = self
        unitsListTableView.delegate = self
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return unitList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = unitList[indexPath.row].name
        cell.selectionStyle = .blue
        
        if selectedUnit!.name == unitList[indexPath.row].name {
            cell.setSelected(true, animated: true)
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    //TODO change editing style
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedUnit = unitList[indexPath.row]
        tableView.cellForRow(at: indexPath)!.setSelected(true, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
