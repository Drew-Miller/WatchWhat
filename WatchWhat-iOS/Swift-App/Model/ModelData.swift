//
//  Data.swift
//  Landmarks
//
//  Created by Drew Miller on 12/6/21.
//

import Foundation
import Combine
import SwiftUI

final class PlayList: ObservableObject {
    @Published var name: String
    @Published var myList = [Movie]()
    
    init(_ name: String) {
        self.name = name
    }
}

final class ModelData: ObservableObject {
    @Published var playlists = [PlayList]()
}

func load<T: Decodable>(_ filename: String, _ ext: String = "json") -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: ext)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
