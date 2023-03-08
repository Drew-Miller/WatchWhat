//
//  ContentView.swift
//  Swift-App
//
//  Created by Drew Miller on 11/6/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home

    enum Tab {
        case home
        case popular
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                HomeView()
                
                VStack {
                    HStack {
                        Text("Top View")
                    }
                    .frame(width: geometry.size.width, height: 40)
                    .background(Color("backgroundLayout"))
                    
                    Spacer()
                    
                    HStack(alignment: .center) {
                        Text("Bottom View")
                    }
                    .edgesIgnoringSafeArea(.bottom)
                    .frame(width: geometry.size.width, height: 40)
                    .background(Color("backgroundLayout"))
                }
                .foregroundColor(Color("text"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
