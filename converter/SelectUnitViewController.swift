//
//  SelectUnitViewController.swift
//  converter
//
//  Created by Chakpiwat Pacharajindawat on 20/11/2561 BE.
//  Copyright © 2561 Chakpiwat. All rights reserved.
//

import UIKit

class SelectUnitViewController: UIViewController {
    public var barTitle: String?
    @IBOutlet weak var unitsListTableView: UITableView!
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var navItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navItem.title = barTitle
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
