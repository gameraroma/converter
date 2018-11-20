//
//  ConvertViewController.swift
//  converter
//
//  Created by Chakpiwat Pacharajindawat on 19/11/2561 BE.
//  Copyright © 2561 Chakpiwat. All rights reserved.
//

import UIKit

class ConvertViewController: UIViewController {
    public var barTitle: String?
    
    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet weak var fromUnitButton: UIButton!
    @IBOutlet weak var toUnitButton: UIButton!
    @IBOutlet weak var copyResultButton: UIButton!
    @IBOutlet weak var fromInputTextField: UITextField!
    @IBOutlet weak var resultOutputTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = barTitle!
    }
    
    @IBAction func switchButtonAction(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            self.switchButton.transform = self.switchButton.transform.rotated(by: CGFloat.pi)
        })
    }
    
    @IBAction func copyResultAction(_ sender: Any) {
    }
    
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SelectUnitViewController
        switch segue.identifier {
        case "FromUnit":
            vc.barTitle = "From Unit"
            break
        case "ToUnit":
            vc.barTitle = "To Unit"
            break
        default:
            return
        }
    }
}
