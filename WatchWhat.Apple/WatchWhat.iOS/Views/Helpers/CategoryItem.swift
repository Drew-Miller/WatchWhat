//
//  MovieView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/19/23.
//

import SwiftUI

struct CategoryItem: View {
    let app = AppState.shared
    let item: Item
    
    var body: some View {
        VStack() {
            Poster(imageUrl: item.posterPath, width: 224.0)
            
            Text(item.title)
                .font(.body)
                .foregroundColor(.text)
                .padding(.top, 6)
                .lineLimit(nil)
                .truncationMode(.tail)
        }
        .onTapGesture {
            app.movieSelected(item.id)
        }
    }
}
