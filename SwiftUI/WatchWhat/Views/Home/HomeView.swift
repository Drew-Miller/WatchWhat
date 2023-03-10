//
//  HomeView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeData = HomeData()
    @State var controlTransition: Float = 0.0
    let onMovieSelected: (Int) -> Void
        
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(homeData.results, id: \.self) { result in
                        MovieList(result: result, onTapGesture: onMovieSelected)
                    }
                }
                .padding(EdgeInsets(top: 55, leading: 0, bottom: 0, trailing: 0))
            }
            .onAppear {
                homeData.loadData()
            }
            .simultaneousGesture(
                DragGesture().onChanged({
                   print($0.translation.height)
                   let isScrollDown = 0 < $0.translation.height
                   
               })
            )
            
            HomeControls {
                print("menu")
            }
            .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
        }
        .foregroundColor(Palette.text)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}


struct HomeControls: View {
    @EnvironmentObject var modelData: ModelData
    
    let onMenu: () -> Void

    var body: some View {
        VStack {
            HStack {
                Button {
                    onMenu()
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .font(.system(size: 25, weight: .light, design: .default))
                }
                
                Spacer()
                
                Image(uiImage: UIImage(named: "logo-white-no-background")!)
                    .resizable()
                    .frame(width: 200, height: 20)

                Spacer()
                
                UserIcon(initials: "D", color: Palette.primary, size: 28) {
                    print("User Tapped")
                }
            }
            
            Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
}

struct UserIcon: View {
    let initials: String
    let color: Color
    let size: CGFloat
    let shadow: CGFloat = 1.5
    let onTapGesture: () -> Void
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: size, height: size)
            Text(initials)
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .bold))
        }
        .overlay(
            Circle()
                .stroke(Color.white, lineWidth: shadow)
        )
        .onTapGesture {
            onTapGesture()
        }
    }
}


