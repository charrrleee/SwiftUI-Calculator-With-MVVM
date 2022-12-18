//
//  CalculatorButtonStyle.swift
//  calculator
//
//  Created by Charlene Cheung on 17/12/2022.
//

import SwiftUI

struct BaseCalculatorButton : ButtonStyle {
    var bounds = UIScreen.main.bounds

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
//            .padding()
            .frame(width: bounds.width / 4, height: bounds.height / 12)
            .foregroundColor(.white)
            .border(.black)
    }
}

struct NumberButtonStyle : ButtonStyle {
    var bounds = UIScreen.main.bounds
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.padding(.all, 0)
//            .padding()
            .frame(width: bounds.width / 4, height: bounds.height / 12)
            .background(Color(red: 96/255, green: 90/255, blue: 89/255))
            .foregroundColor(.white)
            .border(.black)
    }
}

struct OperatorButtonStyle : ButtonStyle {
    var bounds = UIScreen.main.bounds

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
//            .padding()
            .frame(width: bounds.width / 4, height: bounds.height / 12)
            .background(Color(red: 255/255, green: 158/255, blue: 10/255))
            .foregroundColor(.white)
            .border(.black)
    }
}

struct NumberOperatorButtonStyle : ButtonStyle {
    var bounds = UIScreen.main.bounds

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
//            .padding()
            .frame(width: bounds.width / 4, height: bounds.height / 12)
            .background(Color(red: 64/255, green: 57/255, blue: 58/255))
            .foregroundColor(.white)
            .border(.black)
    }
}
