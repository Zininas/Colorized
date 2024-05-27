//
//  ColorSliderView.swift
//  Colorized
//
//  Created by Александр Зинин on 25.05.2024.
//

import SwiftUI

struct ColorSliderView: View {
    
    @Binding var value: Double
    @State private var text = ""
    @State private var showAlert = false
    
    let sliderColor: Color
    
    var body: some View {
        HStack {
            Text(value.formatted())
                .frame(width: 50)
                .foregroundStyle(.white)
                .font(.title3)
                .bold()
            
            Slider(value: $value, in: 0...255, step: 1)
                .tint(sliderColor)
                .background(in: .capsule)
                .blur(radius: 0.3)
                .shadow(radius: 5)
                .onChange(of: value) { _, newValue in
                    text = newValue.formatted()
                }
            
            TextFieldView(text: $text, action: checkValue)
                .alert("Wrong Format", isPresented: $showAlert, actions: {}) {
                    Text("Please enter value from 0 to 255")
                }
        }
        .onAppear {
            text = value.formatted()
        }
    }
    
    private func checkValue() {
        if let value = Double(text), (0...255).contains(value) {
            self.value = value
        } else {
            showAlert.toggle()
            value = 0
            text = "0"
        }
    }
}

#Preview {
    ColorSliderView(value: .constant(100), sliderColor: .orange)
}
