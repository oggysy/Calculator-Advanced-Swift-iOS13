//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTypingNumber: Bool = true
    private var displayValue : Double {
        get {
            guard let numberText = displayLabel.text else { return 0 }
            guard let number = Double(numberText) else { fatalError("Cannot convert display label text to a Double.")}
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        guard let calcMethod = sender.currentTitle, let result = calculator.calculate(symbol: calcMethod) else { return }
        
        displayValue = result
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //What should happen when a number is entered into the keypad
        guard let numValue = sender.currentTitle else { return }
        if isFinishedTypingNumber {
            displayLabel.text = numValue
            isFinishedTypingNumber = false
        } else {
            if numValue == "." {
                let isInt = floor(displayValue) == displayValue
                if !isInt {
                    return
                }
            }
            displayLabel.text?.append(numValue)
        }
    }
    
}

