//
//  Palette.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/8/23.
//

import Foundation
import SwiftUI

extension Color {
    static let primary = Color("Electric Purple")
    
    static let accent = Color("Spring Green")
    
    static let text = Color("Text")
    
    static let background = Color("Raisin Black")
    static let background2 = Color("Errie Black")
    static let backgroundAccent = Color("Licorice")
}

extension Image {
    func icon() -> some View {
        self.foregroundColor(.text).font(.system(size: 24, weight: .light, design: .default))
    }
    
    func brandLogo(size: CGFloat) -> some View {
        self.resizable().frame(width: size, height: size / 10)
    }
}

extension View {
    func header() -> some View {
        self.padding(.horizontal, 20).padding(.top, 8)
    }
    
    func footer() -> some View {
        self
            .padding(.horizontal, 40)
            .padding(.top, 8)
            .background(.background.opacity(0.90))
            .frame(maxWidth: .infinity)
    }
    
    func headerPadding() -> some View {
        self.padding(.top, 64)
    }
    
    func searchPadding() -> some View {
        self.padding(.top, 32)
    }
    
    func footerPadding() -> some View {
        self.padding(.bottom, 60)
    }
}
