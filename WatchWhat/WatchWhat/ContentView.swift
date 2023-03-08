//
//  ContentView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/7/23.
//

import SwiftUI
import Apollo

let apolloClient = ApolloClient(url: URL(string: "http://localhost:7071/graphql")!)

struct ContentView: View {
    init() {
        apolloClient.fetch(query: WatchWhatSchema.GenresQuery()) { result in
          guard let data = try? result.get().data else { return }
            print(data.genres) // Luke Skywalker
        }
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
