//
//  MovieObject.swift
//  Swift-App
//
//  Created by Drew Miller on 11/7/22.
//

import Foundation
import SwiftUI

struct MovieResponse: Codable {
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int
}

struct Movie: TmdbImage, MovieDate, Hashable, Codable {
    let adult: Bool
    let backdropPath: String
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Float
    let posterPath: String
    let releaseDate: String?
    let title: String
    let video: Bool
    let voteAverage: Float
    let voteCount: Int
    
    var backdropUrl: URL? {
        return getImageURL(backdropPath)
    }
    
    var posterUrl: URL? {
        return getImageURL(posterPath)
    }
    
    var release: Date? {
        return formatDate(releaseDate)
    }
    
    var year: String {
        return getYear(releaseDate)
    }
};
