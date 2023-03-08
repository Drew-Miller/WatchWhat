//
//  Videos.swift
//  Swift-App
//
//  Created by Drew Miller on 11/18/22.
//

import Foundation

struct VideoResponse: Codable {
    let id: Int
    let results: [Video]
}

struct Video: MovieDate, Hashable, Codable {
    let iso6391: String
    let iso31661: String
    let name: String
    let key: String
    let site: String
    let size: Int
    let type: String
    let official: Bool
    let publishedAt: String
    let id: String
    
    var published: Date? {
        return formatDate(publishedAt)
    }
    
    var year: String {
        return getYear(publishedAt)
    }
}
