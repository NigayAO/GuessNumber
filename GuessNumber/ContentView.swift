//
//  ContentView.swift
//  GuessNumber
//
//  Created by Alik Nigay on 31.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = Double.random(in: 0...100)
    
    @State private var alertPresent = false
    
    var body: some View {
        VStack {
            Text("Передвиньте слайдер как можно ближе к: \(targetValue)")
                .font(.system(size: 17))
            
            SliderView(value: $currentValue, target: $targetValue, score: computeScore())
                .padding()
            
            ButtonView(title: "Проверь меня!", action: { alertPresent = true } )
                .alert("You record is \(computeScore())", isPresented: $alertPresent, actions: {})
                .padding()
            
            ButtonView(title: "Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
            .padding()
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 12")
        }
    }
}

struct ButtonView: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
        }
    }
}
