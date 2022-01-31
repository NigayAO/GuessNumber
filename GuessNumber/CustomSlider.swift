//
//  SliderView.swift
//  GuessNumber
//
//  Created by Alik Nigay on 31.01.2022.
//

import SwiftUI

struct CustomSlider: UIViewRepresentable {
    
    @Binding var value: Double
    @Binding var target: Int
    
    var score: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.maximumValue = 100
        slider.minimumValue = 0
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changedValue),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        let alpha = CGFloat(score) / 100
        uiView.thumbTintColor = UIColor(
            red: 1, green: 0, blue: 0, alpha: alpha
        )
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider(value: .constant(45), target: .constant(10), score: 10)
    }
}


extension CustomSlider {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func changedValue(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}
