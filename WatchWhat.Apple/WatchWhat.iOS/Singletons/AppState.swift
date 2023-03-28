//
//  UserDefaultsKeys.swift
//  WatchWhat.iOS
//
//  Created by Drew Miller on 3/27/23.
//

import Foundation
import Combine
import SwiftUI

extension String {
    static let defaultKeys = UserDefaultKeys()
    
    class UserDefaultKeys {
        let token: String = "token"
        let view: String = "view"
        let previousView: String = "previousView"
        let movieId: String = "movieId"
        let presentingLoginScreen: String = "presentingLoginScreen"
        let searchValue: String = "searchValue"
    }
}

enum AppView: Int {
    case home           = 0
    case movies         = 1
    case tv             = 2
    case search         = 3
    case movieDetails   = 4
}

@MainActor
class AppState: ObservableObject {
    // App State is initialized here.
    // Using AppStorage attributes in views will override the default app view.
    @AppStorage(.defaultKeys.token) private(set) var token: String?
    @AppStorage(.defaultKeys.view) private(set) var view: AppView = .home
    @AppStorage(.defaultKeys.previousView) private(set) var previousView: AppView = .home
    @AppStorage(.defaultKeys.movieId) private(set) var movieId: Int?
    @AppStorage(.defaultKeys.presentingLoginScreen) var presentingLoginScreen: Bool = false
    @AppStorage(.defaultKeys.searchValue) var searchValue: String = ""
    
    @Published private(set) var movieIds: [Int] = [Int]()
    
    static let shared: AppState = AppState()
    
    private var cancellables = Set<AnyCancellable>()

    private init() {
        $movieIds
        .sink {
            guard $0.count != 0 else {
                self.movieId = nil
                return
            }
            
            self.movieId = $0.last
        }
        .store(in: &cancellables)
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

