//
//  Navigation.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/10/23.
//

import Foundation

enum AppView: Int {
    case home           = 0
    case movies         = 1
    case tv             = 2
    case search         = 3
    case movieDetails   = 4
}

@MainActor
class AppData: ObservableObject {
    @Published private(set) var view: AppView
    @Published private(set) var previousView: AppView
    @Published private(set) var movieIds: [Int] = [Int]()
    @Published var presentingLoginScreen = false
    
    var movieId: Int? {
        return movieIds.last
    }
    
    init() {
        self.view = .home
        self.previousView = .home
    }
    
    func setView(_ view: AppView) {
        self.previousView = self.view
        self.navigate(view)
    }
    
    func navigatePrevious() {
        guard movieId != nil else {
            movieIds.removeLast()
            return
        }
        self.navigate(self.previousView)
    }
    
    func movieSelected(_ id: Int) {
        movieIds.append(id)
        setView(.movieDetails)
    }
    
    private func navigate(_ view: AppView) {
        self.view = view
    }
}
