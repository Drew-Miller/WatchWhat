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
                    .headerIcon()
            }
            
            Spacer()
            
            Image("logo-white-no-background").brandLogo(size: 160)

            Spacer()
            
            UserIcon(fill: .primary, initials: "D", view: .small) {
                print("User Tapped")
            }
        }
        .headerStyles()
    }
}

