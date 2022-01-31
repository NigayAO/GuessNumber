//
//  SliderView.swift
//  GuessNumber
//
//  Created by Alik Nigay on 31.01.2022.
//

import SwiftUI

struct SliderView: View {
    @Binding var value: Double
    @Binding var target: Int
    var score: Int
    var body: some View {
        HStack {
            Text("0")
            CustomSlider(value: $value, target: $target, score: score)
            Text("100")
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(40), target: .constant(60), score: 90)
    }
}
