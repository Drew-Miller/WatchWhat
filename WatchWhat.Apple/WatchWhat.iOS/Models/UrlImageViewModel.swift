//
//  UrlImageModel.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

class UrlImageViewModel: ObservableObject {
    @Published var image: UIImage?
    var urlString: String?
    var imageCache = ImageCache.getImageCache()
    
    // Image Cache
    class ImageCache {
        private static var imageCache = ImageCache()
        static func getImageCache() -> ImageCache {
            return imageCache
        }
        
        var cache = NSCache<NSString, UIImage>()
        
        func get(forKey: String) -> UIImage? {
            return cache.object(forKey: NSString(string: forKey))
        }
        
        func set(forKey: String, image: UIImage) {
            cache.setObject(image, forKey: NSString(string: forKey))
        }
    }
    
    func load(urlString: String?) {
        self.urlString = urlString
        
        if loadImageFromCache() {
            return
        }
        loadImageFromUrl()
    }
    
    
    func loadImageFromCache() -> Bool {
        guard let urlString = urlString else {
            return false
        }
        
        guard let cacheImage = imageCache.get(forKey: urlString) else {
            return false
        }
        
        image = cacheImage
        return true
    }
    
    private func loadImageFromUrl() {
        guard let urlString = urlString else {
            return
        }
        
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: getImageFromResponse(data:response:error:))
        task.resume()
    }
    
    
    private func getImageFromResponse(data: Data?, response: URLResponse?, error: Error?) {
        guard error == nil else {
            print("Error: \(error!)")
            return
        }
        guard let data = data else {
            print("No data found")
            return
        }
        
        DispatchQueue.main.async {
            guard let loadedImage = UIImage(data: data) else {
                return
            }
            self.imageCache.set(forKey: self.urlString!, image: loadedImage)
            self.image = loadedImage
        }
    }
}
