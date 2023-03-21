//
//  ProviderLogo.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/11/23.
//

import SwiftUI

struct ProviderLogo: View {
    let imageUrl: String?
    let maxWidth: CGFloat
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: Configuration.imgUrlStr + imageUrl!)) { image in
                image
                    .resizable()
            } placeholder: {
                Image(systemName: "popcorn.fill")
                    .renderingMode(.original)
                    .resizable()
            }
            .scaledToFit()
            .frame(maxWidth: maxWidth)
            .cornerRadius(6)
        }
    }
}
