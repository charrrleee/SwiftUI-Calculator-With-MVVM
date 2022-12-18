//
//  ContentViewModel.swift
//  calculator
//
//  Created by Charlene Cheung on 17/12/2022.
//

import Foundation

class ContentViewModel : ObservableObject {
    var calculatorType : CalculatorButtonType = CalculatorButtonType.na
    var input : CalculatorButton = CalculatorButton.equal
    
    var numberList: [Double] = [0.0, 0.0]
    @Published var userInputValue: String = ""
    var operatorList: [CalculatorButton] = []
    
    func add(val1: Double, val2: Double) -> Double {
        return val1 + val2
    }
    
    func subtract(val1: Double, val2: Double) -> Double {
        return val1 - val2
    }
    
    func multipy(val1: Double, val2: Double) -> Double {
        return val1 * val2
    }
    
    func divide(val1: Double, val2: Double) -> Double {
        return val1 / val2
    }
    
    func toPercentage(val: Double) -> Double {
        return val / 100
    }
    
    func toOpposeValue(val: Double) -> Double {
        return val / -1.0
    }
    

    func backspace() {
        userInputValue.removeLast()
    }
    
    private func migrateNumber()
    {
        numberList[0] = numberList[1]
        numberList[1] = Double(userInputValue)!
        userInputValue = ""
    }
    
    private func migrateOperator(_ newOperator: CalculatorButton)
    {
        operatorList[0] = operatorList[1]
        operatorList[1] = newOperator
    }
    
    private func clearOperator()
    {
        operatorList = []
    }
    
    
    func handleReset() {
        numberList = [0.0, 0.0]
        userInputValue = ""
        clearOperator()
    }
    
    
    func handleNumberInput(_ userInput: CalculatorButton) {
        if numberList.count > 2 {
            return
        }
        if !operatorList.isEmpty {
            numberList[1] = Double(userInputValue)!
            migrateNumber()
        }
        userInputValue = userInputValue + userInput.name
    }
    
    func handleNumberOperatorInput(_ userInput: CalculatorButton)
    {
        var currentValue = Double(userInputValue)!
        if (userInput == CalculatorButton.dot) {
            if userInputValue.contains(CalculatorButton.dot.name) {
                return
            }
            userInputValue = userInputValue + "."
        } else if(userInput == CalculatorButton.percentage) {
            currentValue = toPercentage(val: currentValue)
            userInputValue = String(currentValue)
        } else if (userInput == CalculatorButton.plusMinus) {
            currentValue = toOpposeValue(val: currentValue)
            userInputValue = String(currentValue)
        }
    }
    
    func handleOperatorInput(_ userInput: CalculatorButton) {
        if operatorList.count > 2 {
            return
        }
        if (operatorList.count == 1 && [CalculatorButton.divide, CalculatorButton.multiply].contains(operatorList[0])) {
            handleCalculation()
        }
        operatorList.append(userInput)
    }
    
    // calculation method with string evaluation logic + arithmetic operation
    func handleCalculation() {
        if operatorList.isEmpty {
            return
        }
        var inProgress = true
        var val : Double = 0.0
        var firstNumber : Double = 0.0
        var secondNumber : Double = 0.0
        
        while inProgress {
            let currentOperator : CalculatorButton
            if operatorList.count == 1 {
                firstNumber = numberList.last!
                secondNumber = Double(userInputValue)!
                currentOperator = operatorList[0]
                operatorList.remove(at: 0)
            } else if (operatorList.count == 2 && [CalculatorButton.divide, CalculatorButton.multiply].contains(operatorList[1])) {
                firstNumber = numberList.last!
                secondNumber = Double(userInputValue)!
                currentOperator = operatorList[1]
                operatorList.remove(at: 1)
                numberList[1] = numberList[0]
            } else {
                print("Error: unexpected error")
                return
            }
            print("\(firstNumber) \(secondNumber) \(currentOperator)")
            
            switch currentOperator {
                case CalculatorButton.adding:
                    val = add(val1: firstNumber, val2: secondNumber)
                case CalculatorButton.subtract:
                    val = subtract(val1: firstNumber, val2: secondNumber)
                case CalculatorButton.multiply:
                    val = multipy(val1: firstNumber, val2: secondNumber)
                case CalculatorButton.divide:
                    val = divide(val1: firstNumber, val2: secondNumber)
                default:
                    val = 0.0
            }
            
            if operatorList.isEmpty {
                inProgress = false
            } else {
                userInputValue = String(val)
            }
            
        }
        
        handleReset()
        userInputValue = String(val)
    }
}
