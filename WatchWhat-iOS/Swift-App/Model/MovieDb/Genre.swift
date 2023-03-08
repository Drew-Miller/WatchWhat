//
//  MovieModels.swift
//  Swift-App
//
//  Created by Drew Miller on 11/7/22.
//

import Foundation

struct GenreResponse: Codable {
    let genres: [Genre]
}

struct Genre: Hashable, Codable {
    let id: Int
    let name: String
};
