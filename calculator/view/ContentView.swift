//
//  ContentView.swift
//  calculator
//
//  Created by Charlene Cheung on 17/12/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @ObservedObject private var vm : ContentViewModel = ContentViewModel()
    private var bounds = UIScreen.main.bounds
    
    var body: some View {
        VStack {
            Text(vm.userInputValue)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: bounds.height / 12 * 5
                )
                .foregroundColor(.white)
                .background(Color(red: 45/255, green: 38/255, blue: 39/255))
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Button("AC"){vm.handleReset()}
                        .buttonStyle(NumberOperatorButtonStyle())
                    Button("+/-"){vm.handleNumberOperatorInput(CalculatorButton.plusMinus)}
                        .buttonStyle(NumberOperatorButtonStyle())
                    Button("%"){vm.handleNumberOperatorInput(CalculatorButton.percentage)}
                        .buttonStyle(NumberOperatorButtonStyle())
                    Button("/"){vm.handleOperatorInput(CalculatorButton.divide)}
                        .buttonStyle(OperatorButtonStyle())
                }
                .frame(maxWidth: bounds.width)
                HStack(spacing: 0) {
                    Button("7"){vm.handleNumberInput(CalculatorButton.seven)}
                        .buttonStyle(NumberButtonStyle())
                    Button("8"){vm.handleNumberInput(CalculatorButton.eight)}
                        .buttonStyle(NumberButtonStyle())
                    Button("9"){vm.handleNumberInput(CalculatorButton.nine)}
                        .buttonStyle(NumberButtonStyle())
                    Button("X"){vm.handleOperatorInput(CalculatorButton.multiply)}
                        .buttonStyle(OperatorButtonStyle())
                }
                HStack(spacing: 0) {
                    Button("4"){vm.handleNumberInput(CalculatorButton.four)}
                        .buttonStyle(NumberButtonStyle())
                    Button("5"){vm.handleNumberInput(CalculatorButton.five)}
                        .buttonStyle(NumberButtonStyle())
                    Button("6"){vm.handleNumberInput(CalculatorButton.six)}
                        .buttonStyle(NumberButtonStyle())
                    Button("-"){vm.handleOperatorInput(CalculatorButton.subtract)}
                        .buttonStyle(OperatorButtonStyle())
                }
                HStack(spacing: 0) {
                    Button("1"){vm.handleNumberInput(CalculatorButton.one)}
                        .buttonStyle(NumberButtonStyle())
                    Button("2"){vm.handleNumberInput(CalculatorButton.two)}
                        .buttonStyle(NumberButtonStyle())
                    Button("3"){vm.handleNumberInput(CalculatorButton.three)}
                        .buttonStyle(NumberButtonStyle())
                    Button("+"){vm.handleOperatorInput(CalculatorButton.adding)}
                        .buttonStyle(OperatorButtonStyle())
                }
                HStack(spacing: 0) {
                    // override old style
                    Button("0"){vm.handleNumberInput(CalculatorButton.zero)}
                        .border(Color(red: 96/255, green: 90/255, blue: 89/255))
                        .frame(width: bounds.width / 4 * 2)
                        .background(Color(red: 96/255, green: 90/255, blue: 89/255))
                        .border(.black)
                        .buttonStyle(NumberButtonStyle())
                    Button("."){vm.handleNumberOperatorInput(CalculatorButton.dot)}
                        .buttonStyle(NumberButtonStyle())
                    Button("="){vm.handleCalculation()}
                        .buttonStyle(OperatorButtonStyle())
                }
            }.frame(height: bounds.height / 12 * 7)
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity
        )
        .background(Color(red: 45/255, green: 38/255, blue: 39/255))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
