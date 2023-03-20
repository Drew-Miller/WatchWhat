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
    static let textBody = Color("Text").opacity(0.85)
    
    static let background = Color("Raisin Black")
    static let background2 = Color("Errie Black")
    static let backgroundAccent = Color("Licorice")
}

extension Font {
    static let header = Font.title.bold()
    static let section = Font.system(size: 16).bold()
    static let paragraph = Font.system(size: 14)
    static let xs = Font.system(size: 12)
    static let xxs = Font.system(size: 8)
}

extension Image {
    func headerIcon() -> some View {
        self.foregroundColor(.text).font(.system(size: 24, weight: .light, design: .default))
    }
    
    func brandLogo(size: CGFloat) -> some View {
        self.resizable().frame(width: size, height: size / 10)
    }
}

extension View {
    func sectionPadding() -> some View {
        self.padding(.top, 8).padding(.bottom, 4)
    }
    
    func paragraph() -> some View {
        self.font(.paragraph).lineSpacing(8)
    }
    
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
    
    func homePadding() -> some View {
        self.padding(.bottom, 48).padding(.top, 64)
    }
    
    func searchPadding() -> some View {
        self.padding(.bottom, 48).padding(.top, 96)
    }
}
