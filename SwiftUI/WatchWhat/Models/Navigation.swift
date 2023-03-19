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
    @Published private(set) var hasFooter = true
    @Published private(set) var view: AppView = .home
    @Published private(set) var previousView: AppView = .home
    
    func setView(_ view: AppView) {
        self.previousView = self.view
        self.navigate(view)
    }
    
    func navigatePrevious() {
        self.navigate(self.previousView)
    }
    
    private func navigate(_ view: AppView) {
        self.view = view
        
        switch view {
        case .movieDetails:
            self.hasFooter = false
        default:
            self.hasFooter = true
        }
    }
}
