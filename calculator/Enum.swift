//
//  Enum.swift
//  calculator
//
//  Created by Charlene Cheung on 17/12/2022.
//

import Foundation

enum CalculatorButton: String {
    case clear, plusMinus, percentage, divide, multiply, subtract, adding, one, two, three, four, five, six, seven, eight, nine, zero, dot, equal
    
    var name: String {
        switch self {
        case .clear: return "A/C"
        case .plusMinus: return "+/-"
        case .percentage: return "%"
        case .divide: return "/"
        case .multiply: return "x"
        case .subtract: return "-"
        case .adding: return "+"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .dot: return "."
        case .zero: return "0"
        case .equal: return "="
        }
    }
}

enum CalculatorButtonType: String {
    case na, number, numberOperator, calOperator
    
}
