//
//  ProviderLogo.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/11/23.
//

import SwiftUI

struct ProviderLogo: View {
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
                    .padding(.bottom, 7)
            } else {
                Image(systemName: "popcorn.fill")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: maxWidth)
                    .padding(.bottom, 7)
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
