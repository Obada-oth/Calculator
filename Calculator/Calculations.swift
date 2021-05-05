//
//  Calculations.swift
//  Calculator
//
//  Created by Obada Othman on 05/05/2021.
//

import Foundation

public struct Calculations {
    
    func addition(enteredValue: Double, secondValue: Double) -> Double {
        return enteredValue + secondValue
    }
    func subtraction (enteredValue: Double, secondValue: Double) -> Double {
        return enteredValue - secondValue
    }
    func multiplication (enteredValue: Double, secondValue: Double) -> Double {
        return enteredValue * secondValue
    }
    func division (enteredValue: Double, secondValue: Double) -> Double {
        return enteredValue / secondValue
    }
    func percentage (secondValue: Double) -> Double {
        return secondValue / 100
    }
    func changeSign(secondValue: Double) -> Double {
        if secondValue != 0 {
           return  secondValue * -1
        }
        return secondValue
    }
}
