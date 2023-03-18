//
//  UserIcon.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/10/23.
//

import SwiftUI

struct UserIcon: View {
    let fill: Color
    let initials: String
    let view: ViewConfiguration
    enum ViewConfiguration {
        case small
        case large
    }
    
    let onTapGesture: () -> Void
    
    var body: some View {
        switch view {
        case .small:
            small()
        default:
            large()
        }
    }
    
    private func main(size: CGFloat) -> some View {
        ZStack {
            Circle()
                .fill(fill)
                .frame(width: size, height: size)
            Text(initials)
                .foregroundColor(.white)
                .font(.system(size: size / 2, weight: .bold))
        }
        .overlay(
            Circle().stroke(.white, lineWidth: size / 20)
        )
        .onTapGesture {
            onTapGesture()
        }
    }
    
    private func small() -> some View {
        self.main(size: 25)
    }
    
    private func large() -> some View {
        self.main(size: 50)
    }
}

