//
//  Footer.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/10/23.
//

import SwiftUI

struct Footer: View {
    @EnvironmentObject var navigationData: NavigationData
    var view: AppView
    let spacing = 4.0
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(spacing: spacing) {
                button(.home, "house")
                
                Text("Home")
                    .font(.footnote)
                    .foregroundColor(.text)
            }
            
            Spacer()
            
            VStack(spacing: spacing) {
                button(.movies, "film")
                
                Text("Movies")
                    .font(.footnote)
                    .foregroundColor(.text)
            }
            
            Spacer()
            
            VStack(spacing: spacing) {
                button(.tv, "tv")
                
                Text("TV")
                    .font(.footnote)
                    .foregroundColor(.text)
            }
            
            Spacer()
            
            VStack(spacing: spacing) {
                button(.search, "magnifyingglass")
                
                Text("Search")
                    .font(.footnote)
                    .foregroundColor(.text)
            }
        }
        .footer()
    }
    
    func button(_ view: AppView, _ icon: String) -> some View {
        return Button {
            navigationData.setView(view)
        } label: {
            Image(systemName: icon)
                .icon()
        }
    }
}


struct Footer_Previews: PreviewProvider {
    static let navigationData = NavigationData()
    
    static var previews: some View {
        Footer(view: .home)
            .environmentObject(navigationData)
        Footer(view: .home)
            .environmentObject(navigationData)
            .preferredColorScheme(.dark)
    }
}
