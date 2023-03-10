//
//  Search.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/10/23.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var modelData: ModelData
    @StateObject var searchData = SearchData()
    var changeView: (AppView) -> Void
        
    var body: some View {
        ZStack {
            // Movies
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(searchData.results, id: \.self) { movie in
                        MovieItem(movie: movie, maxWidth: Configuration.movieItemWidth) { movieId in
                            modelData.movieId = movieId
                            changeView(.movieDetails)
                        }
                    }
                }
                .padding(EdgeInsets(top: 55, leading: 0, bottom: 0, trailing: 0))
            }
            .onAppear {
                searchData.loadData(query: "The Dark Knight")
            }
            .padding(.bottom, 50)
            
            // Controls
            VStack {
                HomeView_Header {
                    print("menu")
                }
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                
                Spacer()
                
                Footer(view: .search) { view in
                    changeView(view)
                }
            }
            
        }
        .foregroundColor(Palette.text)
    }
}

struct SearchVhew_Previews: PreviewProvider {
    static var previews: some View {
        SearchView() { view in
            print("view changed")
        }
        .environmentObject(ModelData())
    }
}

struct HomeView_Header: View {
    @EnvironmentObject var modelData: ModelData
    
    let onMenu: () -> Void

    var body: some View {
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
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
}
