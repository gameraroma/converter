//
//  ConvertViewController.swift
//  converter
//
//  Created by Chakpiwat Pacharajindawat on 19/11/2561 BE.
//  Copyright © 2561 Chakpiwat. All rights reserved.
//

import UIKit

class ConvertViewController: UIViewController {
    var toUnit: Unit?
    var fromUnit: Unit?
    
    public var measureName: String?
    
    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet weak var fromUnitButton: UIButton!
    @IBOutlet weak var toUnitButton: UIButton!
    @IBOutlet weak var copyResultButton: UIButton!
    @IBOutlet weak var fromInputTextField: UITextField!
    @IBOutlet weak var resultOutputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = measureName!
        
        if measureName == "Length" {
            fromUnit = AppData.lengthUnitsList[0]
            toUnit = AppData.lengthUnitsList[1]
            
            fromUnitButton.setTitle(fromUnit?.abbvName, for: .normal)
            toUnitButton.setTitle(toUnit?.abbvName, for: .normal)
        }
    }
    
    @IBAction func switchButtonAction(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            self.switchButton.transform = self.switchButton.transform.rotated(by: CGFloat.pi)
        })
    }
    
    @IBAction func copyResultAction(_ sender: Any) {
    }
    
    @IBAction func inputFieldEditingChanged(_ sender: Any) {
        let field = sender as! UITextField
        resultOutputLabel.text = field.text
    }
    
    
    @IBAction func unwindToConvertView(sender: UIStoryboardSegue) {
        let vc = sender.source as! SelectUnitViewController
        toUnit = vc.selectedUnit
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SelectUnitViewController
        vc.measureName = measureName!
        switch segue.identifier {
        case "FromUnit":
            vc.barTitle = "From Unit"
            vc.selectedUnit = fromUnit
            break
        case "ToUnit":
            vc.barTitle = "To Unit"
            vc.selectedUnit = toUnit
            break
        default:
            return
        }
    }
}
