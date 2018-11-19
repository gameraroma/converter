//
//  ConvertViewController.swift
//  converter
//
//  Created by Chakpiwat Pacharajindawat on 19/11/2561 BE.
//  Copyright © 2561 Chakpiwat. All rights reserved.
//

import UIKit

class ConvertViewController: UIViewController {
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var navigationItems: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar?.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar?.shadowImage = UIImage()
        navigationItems.title = ""
    }
    
    @IBAction func backAction(_ sender: Any) {
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
