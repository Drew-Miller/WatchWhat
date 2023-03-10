//
//  MoviePoster.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

struct MoviePoster: View {
    @ObservedObject var urlImageModel = UrlImageModel()
    let imageUrl: String
    let maxWidth: CGFloat
    
    var body: some View {
        VStack {
            if let image = urlImageModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: maxWidth)
                    .padding(.bottom, 7)
            } else {
                Image(systemName: "popcorn.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: maxWidth)
                    .padding(.bottom, 7)
            }
        }
        .onAppear {
            urlImageModel.load(urlString: Configuration.imgUrlStr + imageUrl)
        }
    }
}
