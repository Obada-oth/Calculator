//
//  ContentView.swift
//  Calculator
//
//  Created by Obada Othman on 26/04/2021.
//

import SwiftUI

enum CalcButton: String{
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "x"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "+/-"
    
    var buttonColor: Color {
        switch self {
        case .add, .subtract, .multiply, .divide, .equal:
            return .orange
        case .clear, .negative, .percent:
            return Color(.lightGray)
        default:
            return Color(UIColor(red:55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
    }
}

enum Operation {
    case add,subtract, divide, multiply, none
}

struct ContentView: View {
    let calculations = Calculations()
    @State var value = "0"
    @State var runningNumber = 0.0
    @State var currentOperation : Operation = .none 
    let buttons: [[CalcButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
        
        VStack {
            Spacer()
            //Text display
            HStack {
                Spacer()
                Text(value)
                    .bold()
                    .font(.system(size: 72))
                    .foregroundColor(.white)
            }
            .padding()
            
            //buttons
            ForEach(buttons, id:\.self) { row in
                HStack(spacing : 12) {
                    
                    ForEach(row, id:\.self) {item in
                        
                        Button(action: {
                            self.didTap(button: item)
                            
                        },label: {
                            Text(item.rawValue)
                                .font(.system(size: 32))
                                .frame(width  : self.buttonWidth(item: item), height: self.buttonHeight())
                                .background(item.buttonColor)
                                .foregroundColor(.white)
                                .cornerRadius(self.buttonWidth(item: item)/2)
                        })
                    }
                }
                .padding(.bottom,3)
                
            }
         }
      }
    }
    
    
    func didTap(button: CalcButton){
        let runningValue = self.runningNumber
        let currentValue = Double(self.value) ?? 0.0
        switch button {
        case .add, .subtract, .multiply, .divide, .equal:
            if button == .add {
                self.currentOperation = .add

                self.runningNumber = Double(self.value) ?? 0.0
            }
            else if button == .subtract {
                self.currentOperation = .subtract
                self.runningNumber = Double(self.value) ?? 0.0
            }
            else if button == .multiply {
                self.currentOperation = .multiply
                self.runningNumber =  Double(self.value) ?? 0.0
            }
           else if button == .divide {
                self.currentOperation = .divide
            self.runningNumber = Double(self.value) ?? 0.0
            }
       
           else if button == .equal {
          
            switch self.currentOperation {
            case .add: self.value = "\(calculations.addition(enteredValue: runningValue, secondValue: currentValue))"
            case .subtract: self.value = "\(calculations.subtraction(enteredValue: runningValue, secondValue: currentValue))"
            case .multiply: self.value = "\(calculations.multiplication(enteredValue: runningValue, secondValue: currentValue))"
            case .divide: self.value = "\(calculations.division(enteredValue: runningValue, secondValue: currentValue))"
            case .none:
                break
            }
           }
            if button != .equal  {
                self.value = "0"
            }
        case .clear: self.value = "0"
        case .decimal: self.value += "."
        case .percent: self.value = "\(calculations.percentage(secondValue: currentValue))"
        case .negative:
            if currentValue != 0 {
            self.value = "\(currentValue * -1)"
            }
        default:
            let number = button.rawValue
            if self.value == "0" {
                value = number
                
            }
            else {
                self.value = "\(self.value)\(number)"
                    
                }
            
        }
        
    }
    func buttonWidth(item: CalcButton) -> CGFloat {
        if item == .zero {
            return (( UIScreen.main.bounds.width - (4*12)) / 4)*2
        }
        return ( UIScreen.main.bounds.width - (5*12)) / 4
    }
    func buttonHeight() -> CGFloat {
        return ( UIScreen.main.bounds.width - (5*12)) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
