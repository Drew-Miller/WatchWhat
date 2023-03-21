//
//  SearchBarView.swift
//  WatchWhat.iOS
//
//  Created by Drew Miller on 3/20/23.
//

import SwiftUI

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}

struct SearchBarView: View {
    @Binding var text: String
    let placeHolder = "What're you searching for?"
    
    var displayText: String {
        if !text.isEmpty {
            return ""
        } else {
            return placeHolder
        }
    }

    var body: some View {
        VStack {
            TextField(displayText, text: $text)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                .background(Color.backgroundAccent)
                .foregroundColor(.text)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
        }
        .padding(.horizontal, 20)
    }
}


struct SearchBarView_Previews: PreviewProvider {
    @State static var text = "Dark Knight"
    
    static var previews: some View {
        SearchBarView(text: $text)
        SearchBarView(text: $text)
            .preferredColorScheme(.dark)
    }
}

