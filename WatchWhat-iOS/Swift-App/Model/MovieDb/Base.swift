//
//  Base.swift
//  Swift-App
//
//  Created by Drew Miller on 11/18/22.
//

import Foundation

protocol TmdbImage {}
extension TmdbImage {
    func getImageURL(_ imagePath: String?) -> URL? {
        guard let path = imagePath else {
            return nil
        }
        return URL(string: "https://image.tmdb.org/t/p/w500" + path)
    }
}

protocol MovieDate {}
extension MovieDate {
    func formatDate(_ dateString: String?) -> Date? {
        guard let date = dateString
        else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-mm-dd"
        
        return dateFormatter.date(from: date)
    }
    
    func getYear(_ dateString: String?) -> String {
        guard let date: Date = formatDate(dateString)
        else {
            return ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let year = dateFormatter.string(from: date)
        return year
    }
}
