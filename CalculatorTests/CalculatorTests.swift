//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Obada Othman on 26/04/2021.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var calculations: Calculations!
    override func setUp() {
        super.setUp()
        calculations = Calculations()
    }

    override func tearDown() {
     calculations = nil
     super.tearDown()

    }

    func test_addition_operation()  {
        XCTAssertEqual(calculations.addition(enteredValue: 1, secondValue: 1), 2)

    }
    
    func test_subtraction_operation()  {
        XCTAssertEqual(calculations.subtraction(enteredValue: 5, secondValue: 1), 4)

    }
    
    func test_multiplication_operation()  {
        XCTAssertEqual(calculations.multiplication(enteredValue: 6, secondValue: 6), 36)

    }
    
    func test_division_operation()  {
        XCTAssertEqual(calculations.division(enteredValue: 9, secondValue: 3), 3)

    }
    
    func test_percentage_operation()  {
        XCTAssertEqual(calculations.percentage(secondValue: 15), 0.15)

    }
    
    func test_change_sign_operation()  {
        XCTAssertEqual(calculations.changeSign(secondValue: 20), -20)

    }
    

}
