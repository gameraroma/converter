//
//  ConvertViewController.swift
//  converter
//
//  Created by Chakpiwat Pacharajindawat on 19/11/2561 BE.
//  Copyright © 2561 Chakpiwat. All rights reserved.
//

import UIKit

class ConvertViewController: UIViewController {
    var fromUnit: Unit?
    var toUnit: Unit?
    
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
        let tempUnit = fromUnit
        fromUnit = toUnit
        toUnit = tempUnit
        
        UIView.animate(withDuration: 0.25, animations: {
            self.switchButton.transform = self.switchButton.transform.rotated(by: CGFloat.pi)
            
            self.fromUnitButton.setTitle(self.fromUnit?.abbvName, for: .normal)
            self.toUnitButton.setTitle(self.toUnit?.abbvName, for: .normal)
        })
        
        UIView.transition(with: self.fromUnitButton,
                          duration:0.25,
                          options: .curveEaseIn,
                          animations: { self.fromUnitButton.alpha = 1.0 },
                          completion: nil)

        UIView.transition(with: self.toUnitButton,
                          duration:0.5,
                          options: .curveEaseIn,
                          animations: { self.toUnitButton.alpha = 1.0 },
                          completion: nil)
    }
    
    @IBAction func copyResultAction(_ sender: Any) {
    }
    
    @IBAction func inputFieldEditingChanged(_ sender: Any) {
        let field = sender as! UITextField
        resultOutputLabel.text = field.text
    }
    
    
    @IBAction func unwindToConvertView(sender: UIStoryboardSegue) {
        let vc = sender.source as! SelectUnitViewController
        switch vc.barTitle {
            case "From Unit":
                fromUnit = vc.selectedUnit
                fromUnitButton.setTitle(fromUnit?.abbvName, for: .normal)
                break
            case "To Unit":
                toUnit = vc.selectedUnit
                toUnitButton.setTitle(toUnit?.abbvName, for: .normal)
                break
            default:
                break
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
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
