//
//  ContentView.swift
//  Colorized
//
//  Created by Александр Зинин on 21.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.blue)
            .ignoresSafeArea()
            VStack {
                ColorizedView(
                    colorView: Color(
                        red: redSliderValue/255,
                        green: greenSliderValue/255,
                        blue: blueSliderValue/255))
                
                VStack {
                    ColorSliderView(value: $redSliderValue, accentColor: .red)
                    ColorSliderView(value: $greenSliderValue, accentColor: .green)
                    ColorSliderView(value: $blueSliderValue, accentColor: .blue)
                }
                .padding()
                
                Spacer()
                
            }
        }
    }
}

struct ColorizedView: View {
    let colorView: Color
    
    var body: some View {
                ZStack {
                    Rectangle()
                        .frame(width: 365, height: 140)
                        .foregroundStyle(.white)
                        .clipShape(.rect(cornerRadius: 25))
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    Rectangle()
                        .frame(width: 355, height: 130)
                        .foregroundStyle(colorView)
                        .clipShape(.rect(cornerRadius: 20))
                }
                .padding()
            }
        }

struct ColorSliderView: View {
    
    @Binding var value: Double
    let accentColor: Color
    
    var body: some View {
        HStack {
                    Text("\(lround(value))")
                        .foregroundStyle(.white)
                        .frame(width: 50)
                        .font(.title3)
                        .bold()
                    Slider(value: $value, in: 0...255, step: 1)
                        .accentColor(accentColor)
                        .background(in: .capsule)
                        .blur(radius: 0.3)
                        .shadow(radius: 5)
                }
            }
        }

struct TextFildeView: View {
    @Binding var value: String
    
    var body: some View {
        TextField("0", text: $value)
            .textFieldStyle(.roundedBorder)
            .frame(width: 55)
            .font(.title3)
            .bold()
    }
}

#Preview {
    ContentView()
}
