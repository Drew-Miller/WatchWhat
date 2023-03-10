//
//  Footer.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/10/23.
//

import SwiftUI

struct Footer: View {
    @EnvironmentObject var modelData: ModelData
    var view: AppView
    var viewSelected: (AppView) -> Void
    
    var body: some View {
        HStack(alignment: .center) {
            Footer_Icon(icon: "house", activeView: view, view: .home) { view in
                viewSelected(view)
            }
            
            Spacer()
            
            Footer_Icon(icon: "film", activeView: view, view: .movies) { view in
                viewSelected(view)
            }
            
            Spacer()
            
            Footer_Icon(icon: "tv", activeView: view, view: .tv) { view in
                viewSelected(view)
            }
            
            Spacer()
            
            Footer_Icon(icon: "magnifyingglass", activeView: view, view: .search) {view in
                viewSelected(view)
            }
        }
        .padding([.top, .bottom], 20)
        .padding([.leading, .trailing], 50)
        .frame(maxWidth: .infinity)
        .background(Palette.footer)
    }
}

struct Footer_Icon: View {
    let icon: String
    var activeView: AppView
    let view: AppView
    let onClick: (AppView) -> Void
    
    var body: some View {
        Button {
            onClick(view)
        } label: {
            Group {
                if view == activeView {
                    Image(systemName: icon)
                        .fontWeight(.regular)
                } else {
                    Image(systemName: icon)
                        .fontWeight(.thin)
                }
            }
            .font(.system(size: 20))
        }
    }
}

