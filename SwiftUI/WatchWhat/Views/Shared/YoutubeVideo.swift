//
//  YoutubeVideo.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/18/23.
//

import AVKit
import SwiftUI

import SwiftUI
import WebKit
//
//struct YouTubeVideo: UIViewRepresentable {
//    let videoId: String
//    func makeUIView(context: Context) ->  WKWebView {
//        return WKWebView()
//    }
//    func updateUIView(_ uiView: WKWebView, context: Context) {
//        guard let demoURL = URL(string: "https://www.youtube.com/embed/\(videoId)") else { return }
//        uiView.scrollView.isScrollEnabled = false
//        uiView.load(URLRequest(url: demoURL))
//    }
//}


struct YouTubeVideo: View {
    @State var player = AVPlayer(url: URL(string: "https://swiftanytime-content.s3.ap-south-1.amazonaws.com/SwiftUI-Beginner/Video-Player/iMacAdvertisement.mp4")!) // 1
    let videoId: String
    
      var body: some View {
              VideoPlayer(player: player)
                  .frame(width: 400,
                         height: 300,
                         alignment: .center)
        
      }
    
//    @State var player = AVPlayer(url: URL(string: "https://youtube.com/embed/z-E5pTQVW8w")!)
//    let videoId: String
//
//    var body: some View {
//        VideoPlayer(player: player)
//            .frame(width: 384, height: 192)
//            .task(id: videoId) {
//                let urlString = "https://youtube.com/embed/\(videoId)"
//                print(urlString)
//                guard let url = URL(string: urlString) else {
//                    return
//                }
//
//                //player = AVPlayer(url: url)
//            }
//    }
}
