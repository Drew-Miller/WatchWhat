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
            Footer_Icon(text: "Home", icon: "house", activeIcon: "house.fill", activeView: view, view: .home) { view in
                changeView(view)
            }
            
            Spacer()
            
            Footer_Icon(text: "Movies", icon: "film", activeIcon: "film.fill", activeView: view, view: .movies) { view in
                changeView(view)
            }
            
            Spacer()
            
            Footer_Icon(text: "TV", icon: "tv", activeIcon: "fv.fill", activeView: view, view: .tv) { view in
                changeView(view)
            }
            
            Spacer()
            
            Footer_Icon(text: "Search", icon: "magnifyingglass", activeIcon: "magnifyingglass.circle.fill", activeView: view, view: .search) {view in
                changeView(view)
            }
        }
        .padding(.top, 7)
        .padding([.leading, .trailing], 40)
        .frame(maxWidth: .infinity)
        .background(Palette.footer)
        .overlay(alignment: .top) {
            Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(Palette.backgroundAccent)
        }
        
    }
}

struct Footer_Icon: View {
    let text: String
    let icon: String
    let activeIcon: String
    var activeView: AppView
    let view: AppView
    let onClick: (AppView) -> Void
    
    var body: some View {
        Button {
            onClick(view)
        } label: {
            VStack {
                Group {
                    if view == activeView {
                        Image(systemName: activeIcon)
                            .fontWeight(.regular)
                    } else {
                        Image(systemName: icon)
                            .fontWeight(.thin)
                    }
                }
                .font(.system(size: 22))
                
                Text(text)
                    .padding(.top, 3)
                    .font(.system(size: 8))
            }
        }
    }
}

