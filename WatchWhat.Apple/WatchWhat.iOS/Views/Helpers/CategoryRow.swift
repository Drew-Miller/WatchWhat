//
//  CategoryView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

struct CategoryRow: View {
    let categoryName: String
    let items: [Movie]

    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.title2)
                .foregroundColor(.text)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 12) {
                    ForEach(items, id: \.self) { item in
                        CategoryItem(item: item)
                    }
                }
            }
            .frame(height: 400)
        }
    }
}
