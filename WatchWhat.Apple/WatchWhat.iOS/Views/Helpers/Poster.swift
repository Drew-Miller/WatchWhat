//
//  MoviePoster.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

struct Poster: View {
    @StateObject var viewModel = UrlImageViewModel()
    let imageUrl: String?
    var width: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        Group {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: width)
            } else {
                Image(systemName: "popcorn.fill")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: width)
            }
        }
        .task(id: imageUrl) {
            load()
        }
    }
    
    private func load() {
        if let url = imageUrl {
            viewModel.load(urlString: Configuration.imgUrlStr + url)
        }
    }
}
