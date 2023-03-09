//
//  Movie.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/8/23.
//

import Foundation

struct Movie {
    let adult: Bool
    let backdropPath: String?
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    
    private let releaseDateString: String
    let var releaseDate: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: self.releaseDateString)
    }
    
    let title: String
    let video: Bool
    let voteAverage: Bool
    let voteAverage: Double
    let voteCount: Int
    
    private init() {}
    
    func static fromPopularMovies(movie: PopularMoviesResult): Movie {
        self.adult              = movie.adult
        self.backdropPath       = movie.backdrop_path
        self.genreIds           = movie.genre_ids
        self.id                 = movie.id
        self.originalLanguage   = movie.original_language
        self.originalTitle      = movie.original_title
        self.popularity         = movie.popularity
        self.posterPath         = movie.poster_path
        self.releaseDate        = movie.release_date // Convert
        self.title              = movie.title
        self.video              = movie.video
        self.voteAverage        = movie.vote_average
        self.voteCount          = movie.vote_count
    }
}
