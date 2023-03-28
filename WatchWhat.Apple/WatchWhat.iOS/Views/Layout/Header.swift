//
//  Header.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/10/23.
//

import SwiftUI

struct Header: View {
    @Environment(\.colorScheme) var colorScheme
    let app = AppState.shared
    
    var body: some View {
        HStack {
            Button {
                print("menu clicked")
            } label: {
                Image(systemName: "line.3.horizontal")
                    .icon()
            }
            
            Spacer()
            
            if colorScheme == .dark {
                Image("logo-white-no-background").brandLogo(size: 140)
            } else {
                Image("logo-color-no-background").brandLogo(size: 140)
            }

            Spacer()
            
            UserIcon(fill: .primary, initials: "D", view: .small) {
                app.presentingLoginScreen.toggle()
            }
        }
        .header()
    }
}

