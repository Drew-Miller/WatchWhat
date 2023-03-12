//
//  Header.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/10/23.
//

import SwiftUI

struct Header: View {
    @EnvironmentObject var modelData: ModelData
    
    let onMenu: () -> Void

    var body: some View {
        HStack {
            Button {
                onMenu()
            } label: {
                Image(systemName: "line.3.horizontal")
                    .font(.system(size: 25, weight: .light, design: .default))
            }
            
            Spacer()
            
            Image(uiImage: UIImage(named: "logo-white-no-background")!)
                .resizable()
                .frame(width: 200, height: 20)

            Spacer()
            
            UserIcon(initials: "D", color: Palette.primary, size: 28) {
                print("User Tapped")
            }
        }
//        .background(
//            LinearGradient(gradient: Gradient(colors: [Palette.backgroundAccent, Color.clear]), startPoint: .topLeading, endPoint: .bottomTrailing)
//        )
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
}

