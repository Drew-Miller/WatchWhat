//
//  HomeView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeData = HomeData()
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
            
            HomeControls {
                print("dismissed")
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
    
    let onDismiss: () -> Void

    var body: some View {
        VStack {
            HStack {
                Button {
                    modelData.movieId = nil
                    onDismiss()
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .font(.system(size: 25, weight: .light, design: .default))
                }
                
                Spacer()
                
                Image(uiImage: UIImage(named: "logo-white-no-background")!)
                    .resizable()
                    .frame(width: 200, height: 20)

                Spacer()
            }
            
            Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
}

