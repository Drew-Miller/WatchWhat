//
//  UserIcon.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/10/23.
//

import SwiftUI

struct UserIcon: View {
    let initials: String
    let color: Color
    let size: CGFloat
    let shadow: CGFloat = 1.5
    let onTapGesture: () -> Void
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: size, height: size)
            Text(initials)
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .bold))
        }
        .overlay(
            Circle()
                .stroke(Color.white, lineWidth: shadow)
        )
        .onTapGesture {
            onTapGesture()
        }
    }
}

