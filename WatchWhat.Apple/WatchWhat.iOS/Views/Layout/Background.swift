//
//  Background.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/8/23.
//

import SwiftUI

struct Background: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(colors: [topColor, bottomColor], startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
