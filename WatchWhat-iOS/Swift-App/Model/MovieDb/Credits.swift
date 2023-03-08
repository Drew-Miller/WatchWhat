//
//  Credits.swift
//  Swift-App
//
//  Created by Drew Miller on 11/18/22.
//

import Foundation

struct CreditsResponse: Codable {
    let id: Int
    let cast: [Cast]
}

struct Cast: TmdbImage, Hashable, Codable {
    let adult: Bool
    let castId: Int
    let character: String
    let creditId: String
    let gender: Int
    let id: Int
    let knownForDepartment: String
    let name: String
    let order: Int
    let originalName: String
    let popularity: Float
    let profilePath: String
    
    
    var profileUrl: URL? {
        return getImageURL(profilePath)
    }
}
