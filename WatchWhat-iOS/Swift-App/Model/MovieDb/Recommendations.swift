//
//  Recommendations.swift
//  Swift-App
//
//  Created by Drew Miller on 11/18/22.
//

import Foundation

struct RecommendationsResponse: Codable {
    let page: Int
    let results: [Recommendation]
    let totalPages: Int
    let totalResults: Int
}

struct Recommendation: TmdbImage, MovieDate, Hashable, Codable {
    let adult: Bool
    let backdropPath: String
    let id: Int
    let title: String
    let originalLanguage: String
    let overview: String
    let posterPath: String
    let mediaType: String
    let genreIds: [Int]
    let popularity: Float
    let releaseDate: String
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
}
