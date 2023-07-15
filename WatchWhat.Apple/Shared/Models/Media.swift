//
//  Media.swift
//  WatchWhat.iOS
//
//  Created by Drew Miller on 4/1/23.
//

import Foundation

enum MediaFormat: String, Codable {
    case movie  = "movie"
    case tv     = "tv"
}

struct PagedResults<TResult>: Codable, Hashable {
    let page: Int
    let totalPages: Int
    let totalResults: Int
    let results: [TResult]
}

struct Media: Hashable, Codable {
    let id: Int
    let name: String
    let poster: String?
    let type: MediaFormat
    var favorite: Bool = false
}
