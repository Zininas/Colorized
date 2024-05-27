//
//  ContentView.swift
//  Colorized
//
//  Created by Александр Зинин on 21.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var red = Double.random(in: 0...255).rounded()
    @State private var green = Double.random(in: 0...255).rounded()
    @State private var blue = Double.random(in: 0...255).rounded()
    
    @FocusState private var isInputeActive: Bool
    
    var body: some View {
        ZStack {
            Color(.blue)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                ColorView(red: red, green: green, blue: blue)
                
                VStack {
                    ColorSliderView(value: $red, sliderColor: .red)
                    ColorSliderView(value: $green, sliderColor: .green)
                    ColorSliderView(value: $blue, sliderColor: .blue)
                }
                .frame(height: 150)
                .focused($isInputeActive)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard){
                        Spacer()
                        Button("Done") {
                            isInputeActive = false
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
        .onTapGesture {
            isInputeActive = false
        }
    }
}

#Preview {
    ContentView()
}
