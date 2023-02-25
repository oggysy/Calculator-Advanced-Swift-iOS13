//
//  Calculator Logic.swift
//  Calculator
//
//  Created by 小木曽佑介 on 2023/02/24.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        guard let n = number else { return nil}
        switch symbol {
        case "+/-":
            return n * -1
        case "AC":
            return 0
        case "%":
            return n * 0.01
        case "=":
            return performTwoNumCalculation(n2: n)
        default :
            intermediateCalculation = (n1: n, calcMethod: symbol)
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        guard let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod else { return nil }
        switch operation {
        case "+":
            return n1 + n2
        case "-":
            return n1 - n2
        case "×":
            return n1 * n2
        case "÷":
            return n1 / n2
        default:
            fatalError("The operation passed in does not match any of the cases.")
        }
    }
}
