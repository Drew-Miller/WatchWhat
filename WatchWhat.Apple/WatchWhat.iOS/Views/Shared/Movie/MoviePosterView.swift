//
//  MoviePoster.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

struct MoviePosterView: View {
    @ObservedObject var urlImageModel = UrlImageModel()
    let imageUrl: String?
    
    var body: some View {
        VStack {
            if let image = urlImageModel.image {
                poster(image: image)
            } else {
                loading
            }
        }
        .onAppear {
            load()
        }
        .task(id: imageUrl) {
            load()
        }
    }
    
    func poster(image: UIImage) -> some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
    }
    
    var loading: some View {
        Image(systemName: "popcorn.fill")
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
    }
    
    private func load() {
        if let url = imageUrl {
            urlImageModel.load(urlString: Configuration.imgUrlStr + url)
        }
    }
}