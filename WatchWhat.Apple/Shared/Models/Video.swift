//
//  Video.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/18/23.
//

import Foundation

struct VideoPage {
    let page: Int
    let total_pages: Int
    let total_results: Int
    let results: [Video]
}

struct Video {
    let id: String
    let key: String
    let name: String?
    let official: Bool
    let publishedAt: String
    let site: String
    let size: Int
    let type: String
}
