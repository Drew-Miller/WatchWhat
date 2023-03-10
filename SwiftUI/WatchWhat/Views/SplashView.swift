//
//  ContentView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/7/23.
//

import SDWebImageSwiftUI
import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: .black, bottomColor: .black)
            
            AnimatedImage(url: URL(string: "https://mir-s3-cdn-cf.behance.net/project_modules/fs/b6e0b072897469.5bf6e79950d23.gif"))
                .resizable()
                .scaledToFit()

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
