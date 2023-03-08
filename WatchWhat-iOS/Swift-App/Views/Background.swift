//
//  Background.swift
//  Swift-App
//
//  Created by Drew Miller on 11/16/22.
//

import SwiftUI

struct Background: View {
    private var isGradient: Bool
    
    var body: some View {
        if isGradient {
            LinearGradient(colors: [Color("backgroundStart"), Color("backgroundEnd")], startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        } else {
            Color("backgroundStart")
                .edgesIgnoringSafeArea(.all)
        }
    }
    
    init(_ isGradient: Bool = true) {
        self.isGradient = isGradient
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background()
    }
}
