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

class Navigation: ObservableObject {
    @Published var view: AppView = .home
    @Published var previousView: AppView = .home
    
    func setView(_ view: AppView) {
        self.previousView = self.view
        self.view = view
    }
    
    func navigatePrevious() {
        self.view = self.previousView
    }
}
