//
//  MovieDetail.swift
//  Swift-App
//
//  Created by Drew Miller on 11/18/22.
//

import Foundation

struct MovieDetailResponse: TmdbImage, MovieDate, Codable {
    let adult: Bool
    let backdropPath: String
    let belongsToCollection: MovieCollection
    let budget: Int
    let genre: [Genre]
    let homepage: String
    let id: Int
    let imdbId: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Float
    let posterPath: String
    let productionCompanies: [ProductionCompany]
    let productionCountries: [ProductionCountry]
    let releaseDate: String?
    let revenue: Int
    let runtime: Int
    let spokenLanguages: [SpokenLanguage]
    let status: String
    let tagline: String
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
}

struct MovieCollection: TmdbImage, Codable {
    let backdropPath: String
    let id: Int
    let name: String
    let posterPath: String
    
    var backdropUrl: URL? {
        return getImageURL(backdropPath)
    }
    
    var posterUrl: URL? {
        return getImageURL(posterPath)
    }
}

struct ProductionCompany: TmdbImage, Hashable, Codable {
    let id: Int
    let logoPath: String?
    let name: String
    let originCountry: String
    
    var logoUrl: URL? {
        return getImageURL(logoPath)
    }
}

struct ProductionCountry: Hashable, Codable {
    let iso31661: String
    let name: String
}

struct SpokenLanguage: Hashable, Codable {
    let englishName: String
    let iso6391: String
    let name: String
}
