//
//  AppIcon.swift
//  Swift-App
//
//  Created by Drew Miller on 11/19/22.
//

import SwiftUI

struct AppIcon: View {
    private var imageName: String
    private var size: CGFloat
    
    var body: some View {
        Image(systemName: imageName)
            .font(.system(size: size, weight: .regular, design: .default))
    }
    
    init(_ imageName: String, size: CGFloat = 24) {
        self.imageName = imageName
        self.size = size
    }
}

struct AppIcon_Previews: PreviewProvider {
    static var previews: some View {
        AppIcon("play.fill")
    }
}
