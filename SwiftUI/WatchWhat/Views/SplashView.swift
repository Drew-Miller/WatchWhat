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
            Background(topColor: .black, bottomColor: .black)

            VStack {
                Spacer()
                
                Image("logo-white-no-background").brandLogo(size: 300)
                
                Spacer()
            }
            
        }
        .preferredColorScheme(.dark)
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
