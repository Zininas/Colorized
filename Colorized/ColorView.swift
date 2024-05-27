//
//  ColorizedView.swift
//  Colorized
//
//  Created by Александр Зинин on 21.05.2024.
//

import SwiftUI

struct ColorView: View {
    
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        Color(red: red/255, green: green/255, blue: blue/255)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .frame(height: 140)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white, lineWidth: 4))
            }
        }

#Preview {
    ColorView(red: 50, green: 50, blue: 50)
}
