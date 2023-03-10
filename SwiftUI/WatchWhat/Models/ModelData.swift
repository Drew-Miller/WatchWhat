//
//  ModelData.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import Foundation

enum SheetView {
    case home
    case movieDetails
    case video
}

class ModelData: ObservableObject {
    @Published private(set) var view: SheetView = .home
    @Published private(set) var previousView: SheetView = .home
    @Published var movieId: Int? = nil
    
    func setView(_ view: SheetView) {
        self.previousView = self.view
        self.view = view
    }
    
    func navigatePrevious() {
        self.view = self.previousView
    }
}

