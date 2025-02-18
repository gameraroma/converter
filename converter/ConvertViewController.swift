//
//  ConvertViewController.swift
//  converter
//
//  Created by Chakpiwat Pacharajindawat on 19/11/2561 BE.
//  Copyright © 2561 Chakpiwat. All rights reserved.
//

import UIKit

class ConvertViewController: UIViewController, UITextFieldDelegate {
    // MARK: private properties
    var fromUnit: Unit?
    var toUnit: Unit?
    
    // Assign from previous page to indicate that which measurement is used in this page
    var unitDimensionType: Dimension?
    var unitList = [Dimension]()
    
    // MARK: outlet properties
    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet weak var fromUnitButton: UIButton!
    @IBOutlet weak var toUnitButton: UIButton!
    @IBOutlet weak var copyResultButton: UIButton!
    @IBOutlet weak var fromInputTextField: UITextField!
    @IBOutlet weak var resultOutputLabel: UILabel!
    @IBOutlet weak var revertSignButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = NSStringFromClass(type(of: unitDimensionType!)).replacingOccurrences(of: "NSUnit", with: "")
        
        revertSignButton.isHidden = true
        switch unitDimensionType {
        case is UnitLength:
            unitList = AppData.lengthUnitsList
            break
        case is UnitTemperature:
            unitList = AppData.temperatureUnitsList
            revertSignButton.isHidden = false
            break
        case is UnitMass:
            unitList = AppData.massUnitsList
            break
        case is UnitArea:
            unitList = AppData.areaUnitsList
            break
        case is UnitVolume:
            unitList = AppData.volumeUnitsList
            break
        case is UnitAngle:
            unitList = AppData.angleUnitsList
            break
        default:
            // negligible
            unitList = AppData.lengthUnitsList
            break
        }
        
        fromUnit = unitList[0]
        toUnit = unitList[1]
        
        fromUnitButton.setTitle(fromUnit?.symbol, for: .normal)
        toUnitButton.setTitle(toUnit?.symbol, for: .normal)
        
        fromInputTextField.delegate = self
        
        doConversion()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // for show keyboard immediately to be used for input text field
        fromInputTextField.becomeFirstResponder()
    }
    
    // MARK: actions
    @IBAction func switchButtonAction(_ sender: Any) {
        switchUnitConversion()
        doConversion()
    }
    
    @IBAction func copyResultAction(_ sender: Any) {
        UIPasteboard.general.string = resultOutputLabel.text
        
        resultOutputLabel.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.resultOutputLabel.alpha = 1.0
        })
    }
    
    @IBAction func inputFieldEditingChanged(_ sender: Any) {
        doConversion()
    }
    
    @IBAction func revertSignButtonAction(_ sender: Any) {
        // Double can detect text is number format or not, if not Double will return nil and `value` will be 0.0 as default value
        var value = Double(fromInputTextField.text!) ?? 0.0
        if value > 0.0 || value < 0.0 {
            value = 0.0 - value
        }
        fromInputTextField.text = "\(value)"
        doConversion()
    }
    
    // callback when navigate back from Select Unit View Controller
    @IBAction func unwindToConvertView(sender: UIStoryboardSegue) {
        let vc = sender.source as! SelectUnitViewController
        let selectedUnit = vc.selectedUnit
        switch vc.barTitle {
            case "From Unit":
                if selectedUnit == toUnit {
                    switchUnitConversion()
                }
                else {
                    fromUnit = vc.selectedUnit
                    fromUnitButton.setTitle(fromUnit?.symbol, for: .normal)
                }
                break
            case "To Unit":
                if selectedUnit == fromUnit {
                    switchUnitConversion()
                }
                else {
                    toUnit = vc.selectedUnit
                    toUnitButton.setTitle(toUnit?.symbol, for: .normal)
                }
                break
            default:
                break
        }
        doConversion()
    }
    
    //MARK: UITextFieldDelegate
    func textField(_ textField: UITextField,shouldChangeCharactersIn range: NSRange,replacementString string: String) -> Bool
    {
        let separatedString = fromInputTextField.text?.components(separatedBy: ".")
        let countdots = (separatedString?.count)! - 1
        if countdots > 0 && string.contains(".") {
            return false
        }
        return true
    }

    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let vc = segue.destination as! SelectUnitViewController
        vc.unitList = unitList
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
    
    private func switchUnitConversion() {
        let tempUnit = fromUnit
        fromUnit = toUnit
        toUnit = tempUnit
        
        resultOutputLabel.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.switchButton.transform = self.switchButton.transform.rotated(by: CGFloat.pi)
            
            self.resultOutputLabel.alpha = 1.0
        })
        
        self.fromUnitButton.setTitle(self.fromUnit?.symbol, for: .normal)
        self.toUnitButton.setTitle(self.toUnit?.symbol, for: .normal)
    }
    
    private func doConversion() {
        var text : String = fromInputTextField.text!
        // prevent empty text field
        if text == "" {
            fromInputTextField.text = "0"
            text = "0"
        }
        // eliminate zero at start
        if text.first == "0" && text.count > 1 && !text.contains(".") {
            text.remove(at: text.startIndex)
            fromInputTextField.text = text
        }
        // output text must be decimal or integer
        let textDouble = Double(text)
        if textDouble != nil {
            let measurement = Measurement(value: textDouble ?? 0, unit: fromUnit! as! Dimension)
            let convertedMeasurement = measurement.converted(to: toUnit as! Dimension)
            resultOutputLabel.text = "\(convertedMeasurement.value)"
        }
    }
}
