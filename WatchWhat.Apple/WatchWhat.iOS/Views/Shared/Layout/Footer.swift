//
//  Footer.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/10/23.
//

import SwiftUI

struct Footer: View {
    var view: AppView
    var changeView: (AppView) -> Void
    
    var body: some View {
        HStack(alignment: .center) {
            Footer_Icon(text: "Home", icon: view == .home ? "house.fill" : "house") {
                changeView(.home)
            }
            
            Spacer()
            
            Footer_Icon(text: "Movies", icon: view == .movies ? "film.fill" : "film") {
                changeView(.movies)
            }
            
            Spacer()
            
            Footer_Icon(text: "TV", icon: view == .tv ? "tv.fill" : "tv") {
                changeView(.tv)
            }
            
            Spacer()
            
            Footer_Icon(text: "Search", icon: view == .search ? "magnifyingglass" : "magnifyingglass") {
                changeView(.search)
            }
        }
        .footer()
    }
}


struct Footer_Previews: PreviewProvider {
    static var previews: some View {
        Footer(view: .home) { view in
            print("changed view")
        }
        .preferredColorScheme(.dark)
    }
}

struct Footer_Icon: View {
    let text: String
    let icon: String
    let onClick: () -> Void
    
    var body: some View {
        Button {
            withAnimation {
                onClick()
            }
        } label: {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 22, weight: .thin))
                    .foregroundColor(.text)
                
                Text(text)
                    .font(.xxs)
                    .foregroundColor(.text)
            }
        }
    }
}

