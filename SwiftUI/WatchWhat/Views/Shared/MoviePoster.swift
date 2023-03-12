//
//  MoviePoster.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

struct MoviePoster: View {
    @ObservedObject var urlImageModel = UrlImageModel()
    let imageUrl: String?
    let maxWidth: CGFloat
    
    var body: some View {
        VStack {
            if let image = urlImageModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: maxWidth)
            } else {
                Image(systemName: "popcorn.fill")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: maxWidth)
            }
        }
        .onAppear {
            if imageUrl?.isEmpty ?? true {
                return
            } else {
                urlImageModel.load(urlString: Configuration.imgUrlStr + imageUrl!)
            }
        }
    }
}
