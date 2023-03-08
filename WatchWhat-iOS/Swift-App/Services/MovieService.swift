//
//  MovieService.swift
//  Swift-App
//
//  Created by Drew Miller on 11/18/22.
//

import Foundation
import SwiftUI

enum GFError: String, Error {
    case initializationError    = "The url requested could not be built."
    case invalidPage            = "The starting page number is 1. Please try again."
    case unableToComplete       = "Unable to complete your request. Please check your internet connection."
    case invalidResponse        = "Invalid response from the server. Please try again."
    case invalidData            = "The data received from the server was invalid. Please try again."
    case unableToFavorite       = "There was an error favoriting this user. Please try again."
    case alreadyInFavorites     = "You already favorites this user. You must REALLY like them."
}

enum Result<Success, Failure: Error> {
    case success(Success)
    case failure(Failure)
}

// The MovieDb API Functions
final class MovieService {
    static let shared   = MovieService()
    private let cache   = NSCache<NSString, UIImage>()
    private let apiKey  = "d4bbe5d6dc46bbb42aa2bbda9eab1c2b"
    
    private init() { }

    func getGenres(completed: @escaping (Result<GenreResponse, GFError>) -> Void) {
        let endpoint = "https://api.themoviedb.org/3/genre/movie/list?api_key=\(apiKey)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.initializationError))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let genreResponse = try decoder.decode(GenreResponse.self, from: data)
                completed(.success(genreResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }

    func getMoviesByGenre(genreId: Int, page: Int = 1, completed: @escaping (Result<MovieResponse, GFError>) -> Void) {
        let endpoint = "https://api.themoviedb.org/3/discover/movie?api_key=\(apiKey)&with_genres=\(String(genreId))&page=\(String(page))"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.initializationError))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let movieResponse = try decoder.decode(MovieResponse.self, from: data)
                completed(.success(movieResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func getMovie(movieId: Int, completed: @escaping (Result<MovieDetailResponse, GFError>) -> Void) {
        let endpoint = "https://api.themoviedb.org/3/movie/\(movieId)?api_key=\(apiKey)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.initializationError))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let movieDetailResponse = try decoder.decode(MovieDetailResponse.self, from: data)
                completed(.success(movieDetailResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func getCredits(movieId: Int, completed: @escaping (Result<CreditsResponse, GFError>) -> Void) {
        let endpoint = "https://api.themoviedb.org/3/movie/\(movieId)/credits?api_key=\(apiKey)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.initializationError))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let creditsResponse = try decoder.decode(CreditsResponse.self, from: data)
                completed(.success(creditsResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func getVideos(movieId: Int, completed: @escaping (Result<VideoResponse, GFError>) -> Void) {
        let endpoint = "https://api.themoviedb.org/3/movie/\(movieId)/videos?api_key=\(apiKey)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.initializationError))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let videoResponse = try decoder.decode(VideoResponse.self, from: data)
                completed(.success(videoResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func getRecommendations(movieId: Int, completed: @escaping (Result<RecommendationsResponse, GFError>) -> Void) {
        let endpoint = "https://api.themoviedb.org/3/movie/\(movieId)/recommendations?api_key=\(apiKey)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.initializationError))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let recommendationsResponse = try decoder.decode(RecommendationsResponse.self, from: data)
                completed(.success(recommendationsResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}

