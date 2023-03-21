//
//  ContentView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/7/23.
//

import SwiftUI

struct SplashView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            Background(topColor: .background, bottomColor: .background)

            VStack {
                Spacer()
                
                if colorScheme == .dark {
                    Image("logo-white-no-background").brandLogo(size: 300)
                } else {
                    Image("logo-color-no-background").brandLogo(size: 300)
                }
                
                Spacer()
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
        SplashView()
            .preferredColorScheme(.dark)
    }
}
