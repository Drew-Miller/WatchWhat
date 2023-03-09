//
//  Movie.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/8/23.
//

import Foundation

struct Movie: Hashable {
    let adult: Bool
    let backdropPath: String?
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: Date
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    private init(
        adult: Bool,
        backdropPath: String?,
        genreIds: [Int],
        id: Int,
        originalLanguage: String,
        originalTitle: String,
        overview: String,
        popularity: Double,
        posterPath: String?,
        releaseDate: Date,
        title: String,
        video: Bool,
        voteAverage: Double,
        voteCount: Int
    ) {
        self.adult = adult
        self.backdropPath = backdropPath
        self.genreIds = genreIds
        self.id = id
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
    
    // 
    static func fromPopularMovies(movie: PopularMoviesResult) -> Movie {
        let releaseDate: Date = Movie.formatDate(dateString: movie.release_date)
        
        let movie = Movie(
            adult              : movie.adult,
            backdropPath       : movie.backdrop_path,
            genreIds           : movie.genre_ids,
            id                 : movie.id,
            originalLanguage   : movie.original_language,
            originalTitle      : movie.original_title,
            overview           : movie.overview,
            popularity         : movie.popularity,
            posterPath         : movie.poster_path,
            releaseDate        : releaseDate,
            title              : movie.title,
            video              : movie.video,
            voteAverage        : movie.vote_average,
            voteCount          : movie.vote_count
        )
        
        return movie
    }
    
    private static func formatDate(dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: dateString)!
    }
}
