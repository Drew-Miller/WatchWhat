//
//  ContentView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/7/23.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: .black, bottomColor: .black)

            VStack {
                Spacer()
                
                Image("logo-white-no-background")
                    .resizable()
                    .frame(width: 300, height: 50)
                
                Spacer()
            }
            
        }
        .foregroundColor(Palette.text)
        .preferredColorScheme(.dark)
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
