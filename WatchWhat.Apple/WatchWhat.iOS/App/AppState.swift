//
//  UserDefaultsKeys.swift
//  WatchWhat.iOS
//
//  Created by Drew Miller on 3/27/23.
//

import Foundation
import Combine
import SwiftUI

struct SelectedId: Codable, RawRepresentable {
    enum CodingKeys: String, CodingKey {
        case media
        case id
    }
    
    let media: MediaType
    let id: Int
    
    init(media: MediaType, id: Int) {
        self.media = media
        self.id = id
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.media = try container.decode(MediaType.self, forKey: .media)
        self.id = try container.decode(Int.self, forKey: .id)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(media, forKey: .media)
        try container.encode(id, forKey: .id)
    }
    
    init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8) else {
            return nil
        }
        do {
            let decoder = JSONDecoder()
            self = try decoder.decode(SelectedId.self, from: data)
        } catch {
            print("Failed to decode SelectedId from raw value: \(error.localizedDescription)")
            return nil
        }
    }
    
    var rawValue: String {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(self)
            return String(data: data, encoding: .utf8) ?? ""
        } catch {
            print("Failed to encode SelectedId to raw value: \(error.localizedDescription)")
            return ""
        }
    }
}


enum AppView: Int {
    case home           = 0
    case movies         = 1
    case tv             = 2
    case search         = 3
    case details   = 4
}

extension String {
    static let defaultKeys = UserDefaultKeys()
    
    class UserDefaultKeys {
        let token: String                   = "token"
        let view: String                    = "view"
        let previousView: String            = "previousView"
        let selectedId: String              = "selectedId"
        let presentingLoginScreen: String   = "presentingLoginScreen"
        let searchValue: String             = "searchValue"
    }
}

@MainActor
class AppState: ObservableObject {
    // App State is initialized here.
    // Using AppStorage attributes in views will override the default app view.
    @AppStorage(.defaultKeys.token) private(set) var token: String?
    @AppStorage(.defaultKeys.presentingLoginScreen) var presentingLoginScreen: Bool = false
    @AppStorage(.defaultKeys.searchValue) var searchValue: String = ""
    
    @AppStorage(.defaultKeys.view) private(set) var view: AppView = .home
    @AppStorage(.defaultKeys.previousView) private(set) var previousView: AppView = .home
    
    @AppStorage(.defaultKeys.selectedId) private(set) var selectedId: SelectedId?
    @Published private(set) var selectedIds: [SelectedId] = [SelectedId]()
    
    static let shared: AppState = AppState()
    
    private var cancellables = Set<AnyCancellable>()

    private init() {
        $selectedIds
        .sink {
            guard $0.count != 0 else {
                self.selectedId = nil
                return
            }
            
            self.selectedId = $0.last
        }
        .store(in: &cancellables)
    }
    
    func setView(_ view: AppView) {
        self.previousView = self.view
        self.navigate(view)
    }
    
    func navigatePrevious() {
        guard selectedIds.count == 0 else {
            selectedIds.removeLast()
            return
        }
        
        self.setView(self.previousView)
    }
    
    func mediaSelected(_ media: MediaType, _ id: Int) {
        selectedIds.append(SelectedId(media: media, id: id))
        setView(.details)
    }
    
    private func navigate(_ view: AppView) {
        // Default navigation
        if view == AppView.details && selectedIds.count == 0 {
            self.view = .home
            return
        }
        
        self.view = view
    }
}

