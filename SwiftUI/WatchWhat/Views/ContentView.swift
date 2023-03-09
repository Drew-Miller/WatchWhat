//
//  ContentView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/7/23.
//

import SwiftUI
import Apollo

let apolloClient = ApolloClient(url: Configuration.baseURL)

//apolloClient.fetch(query: WatchWhatSchema.GenresQuery()) { result in
//  guard let data = try? result.get().data else { return }
//    print(data.genres) // Luke Skywalker
//}

struct ContentView: View {
    var body: some View {
        MovieAppView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MovieAppView: View {
    
    let categories = ["Action", "Comedy", "Drama", "Thriller"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 0) {                    
                    ForEach(categories, id: \.self) { category in
                        CategoryView(category: category)
                    }
                    
                    FooterView()
                }
            }
        }
    }
}

struct CategoryView: View {
    
    let category: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(category)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(0..<10) { _ in
                        MoviePosterView()
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
    }
}

struct MoviePosterView: View {
    
    var body: some View {
        Image("poster-placeholder")
            .resizable()
            .scaledToFit()
            .cornerRadius(8)
            .frame(width: 160, height: 240)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
    }
}

struct FooterView: View {
    
    var body: some View {
        HStack {
            Spacer()
            NavigationLink(destination: Text("Favorites")) {
                Image(systemName: "heart.fill")
                    .font(.title)
            }
            Spacer()
            NavigationLink(destination: Text("Search")) {
                Image(systemName: "magnifyingglass")
                    .font(.title)
            }
            Spacer()
            NavigationLink(destination: Text("Settings")) {
                Image(systemName: "gearshape")
                    .font(.title)
            }
            Spacer()
            NavigationLink(destination: Text("Profile")) {
                Image(systemName: "person.crop.circle")
                    .font(.title)
            }
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.2))
    }
}

