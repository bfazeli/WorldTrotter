//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Bijan Fazeli on 5/25/18.
//  Copyright © 2018 Fazeli, Bijan. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    // Created a property observer that will update the celsius label whenever it's value changes
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet{
            updateCelsiusLabel()
        }
    }
    
    // celsiusValue's value will be computed whenever used
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    // Update farheinheit value if it's field changed
    @IBAction func fahrenheitFieldChanged(_ sender: UITextField) {
        if let text = sender.text, let input = Double(text){
            fahrenheitValue = Measurement(value: input, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
        
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = String(celsiusValue.value)
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCelsiusLabel()
    }
}
