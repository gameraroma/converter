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
    
    override func viewWillAppear(_ animated: Bool) {
        fromInputTextField.becomeFirstResponder()
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
    }
    
    @IBAction func copyResultAction(_ sender: Any) {
        UIPasteboard.general.string = resultOutputLabel.text
        
        resultOutputLabel.alpha = 0.0;
        UIView.animate(withDuration: 0.25, //Time duration you want,
            delay: 0.0,
            options: .curveEaseIn,
            animations: { self.resultOutputLabel.alpha = 1.0 },
            completion: nil )
    }
    
    @IBAction func inputFieldEditingChanged(_ sender: Any) {
        let field = sender as! UITextField
        var text : String = field.text!
        // prevent empty text field
        if text == "" {
            field.text = "0"
            text = "0"
        }
        // eliminate zero at start
        if text.first == "0" && text.count > 1 && !text.contains(".") {
            text.remove(at: text.startIndex)
            field.text = text
        }
        // output text must be decimal or integer
        let textFloat = Float(text)
        if textFloat != nil {
            resultOutputLabel.text = "\(textFloat ?? 0)"
        }
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
