// The Swift Programming Language
// https://docs.swift.org/swift-book

//
//  ButtonExtensions.swift
//  SwiftUIColorButtons
//
//  Created by Micah Kimel on 12/31/24.
//

import Foundation
import SwiftUI
import Combine

@available(macOS 15.1, *)
extension View {
    
    dynamic func buttonStyleMint(enabled: @escaping () -> Bool = { true }) -> some View {
        ModifiedContent(content: self, modifier: ButtonStyle(color: Color.mint, enabled: enabled))
        
    }
    
    dynamic func buttonStyleCharcoal(enabled: @escaping () -> Bool = { true }) -> some View {
        ModifiedContent(content: self, modifier: ButtonStyle(color: Color(hex: "565859"), enabled: enabled))
        
    }
    
    dynamic func buttonStyleBlueDusk(enabled: @escaping () -> Bool = { true }) -> some View {
        ModifiedContent(content: self, modifier: ButtonStyle(color: Color(hex: "96B6C5"), enabled: enabled))
    }
    
    dynamic func buttonStyleIndigo(enabled: @escaping () -> Bool = { true }) -> some View {
        ModifiedContent(content: self, modifier: ButtonStyle(color: Color.indigo, enabled: enabled))
    }
    dynamic func buttonStyleTeal(enabled: @escaping () -> Bool = { true }) -> some View {
        ModifiedContent(content: self, modifier: ButtonStyle(color: Color.teal, enabled: enabled))
    }
    dynamic func buttonStyleGreen(enabled: @escaping () -> Bool = { true }) -> some View {
        ModifiedContent(content: self, modifier: ButtonStyle(color: Color.green, enabled: enabled))
    }
    dynamic func buttonStyleGreenSmall(enabled: @escaping () -> Bool = { true }) -> some View {
        ModifiedContent(content: self, modifier: ButtonStyleSmall(color: Color.green, enabled: enabled))
    }
    dynamic func buttonStyleBrown(enabled: @escaping () -> Bool = { true }) -> some View {
        ModifiedContent(content: self, modifier: ButtonStyle(color: Color.brown, enabled: enabled))
    }
    dynamic func buttonStyleBlack(enabled: @escaping () -> Bool = { true }) -> some View {
        ModifiedContent(content: self, modifier: ButtonStyle(color: Color.black, enabled: enabled))
    }
    
    dynamic func buttonStyleGray(enabled: @escaping () -> Bool = { true }) -> some View {
        ModifiedContent(content: self, modifier: ButtonStyle(color: .gray, enabled: enabled))
    }
    
    dynamic func buttonStyleSkyBlue(enabled: @escaping () -> Bool = { true }) -> some View {
        ModifiedContent(content: self, modifier: ButtonStyle(color: Color(hex: "4cc4fc"), enabled: enabled))
    }
    
    dynamic func buttonStyleYellow(enabled: @escaping () -> Bool = { true }) -> some View {
        ModifiedContent(content: self, modifier: ButtonStyle(color: Color.yellow, enabled: enabled))
    }
    
    dynamic func buttonStyleBlue(enabled: @escaping () -> Bool = { true }) -> some View {
        ModifiedContent(content: self, modifier: ButtonStyle(color: Color.blue, enabled: enabled))
    }
    
    dynamic func buttonStyleRed(enabled: @escaping () -> Bool = { true }) -> some View {
        ModifiedContent(content: self, modifier: ButtonStyle(color: Color.red, enabled: enabled))
    }
    
    dynamic func buttonStyleRedSmall(enabled: @escaping () -> Bool = { true }) -> some View {
        ModifiedContent(content: self, modifier: ButtonStyleSmall(color: Color.red, enabled: enabled))
    }
    
    dynamic func buttonStylePink(enabled: @escaping () -> Bool = { true }) -> some View {
        ModifiedContent(content: self, modifier: ButtonStyle(color: Color.pink, enabled: enabled))
    }
}

@available(macOS 15.1, *)
struct ButtonStyle: ViewModifier {
    private let color: Color
    private let enabled: () -> Bool
    init(color: Color, enabled: @escaping () -> Bool = { true }) {
        self.color = color
        self.enabled = enabled
    }

    dynamic func body(content: Content) -> some View {
        content
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .foregroundColor(Color.white)
            .background(enabled() ? color : Color.black)
            .cornerRadius(5)
    }
}

@available(macOS 15.1, *)
struct ButtonStyleSmall: ViewModifier {
    private let color: Color
    private let enabled: () -> Bool
    init(color: Color, enabled: @escaping () -> Bool = { true }) {
        self.color = color
        self.enabled = enabled
    }

    dynamic func body(content: Content) -> some View {
        content
            .padding(5)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .foregroundColor(Color.white)
            .background(enabled() ? color : Color.black)
            .cornerRadius(5)
    }
}

@available(macOS 15.1, *)
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff

        self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff)
    }
}

