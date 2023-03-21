//
//  Header.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/10/23.
//

import SwiftUI

struct Header: View {
    @EnvironmentObject var appData: AppData
    
    var body: some View {
        HStack {
            Button {
                print("menu clicked")
            } label: {
                Image(systemName: "line.3.horizontal")
                    .icon()
            }
            
            Spacer()
            
            Image("logo-white-no-background").brandLogo(size: 160)

            Spacer()
            
            UserIcon(fill: .primary, initials: "D", view: .small) {
                appData.presentingProfileScreen.toggle()
            }
        }
        .header()
    }
}

