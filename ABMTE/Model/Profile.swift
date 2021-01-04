//
//  Profile.swift
//  ABMTE
//
//  Created by Maroš Gemzický on 02/01/2021.
//

import Foundation
import Combine

class Profile: ObservableObject {
    var username: String
    var prefersNotifications: Bool
    var seasonalPhoto: Season
    var goalDate: Date
//    static var `default` = Profile(username: "", prefersNotifications: true, seasonalPhoto: Season.spring, goalDate: Date())

    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"

        var id: String { self.rawValue }
    }

    init(username: String, prefersNotifications: Bool, seasonalPhoto: Season, goalDate: Date) {
//        self.username = ""
//        self.prefersNotifications = true
//        self.seasonalPhoto = Season.spring
//        self.goalDate = Date()
        self.username = UserDefaults.standard.object(forKey: "username") as? String ?? ""
        self.prefersNotifications = UserDefaults.standard.object(forKey: "prefersNotifications") as? Bool ?? true
        self.seasonalPhoto = UserDefaults.standard.object(forKey: "seasonalPhoto") as? Profile.Season ?? Profile.Season.spring
        self.goalDate = UserDefaults.standard.object(forKey: "goalDate") as? Date ?? Date()
        self.`default` = Profile (username: "", prefersNotifications: true, seasonalPhoto: Season.spring, goalDate: Date())
    }

    static var `default` = Profile(username: "", prefersNotifications: true, seasonalPhoto: Season.spring, goalDate: Date())
    @Published var `default`: Profile {
        didSet {
            UserDefaults.standard.set(`default`.username, forKey: "username")
            UserDefaults.standard.set(`default`.prefersNotifications, forKey: "prefersNotifications")
            UserDefaults.standard.set(`default`.seasonalPhoto, forKey: "seasonalPhoto")
            UserDefaults.standard.set(`default`.goalDate, forKey: "goalDate")
        }
    }
}

//struct Profile {
//    var username: String
//    var prefersNotifications = true
//    var seasonalPhoto = Season.winter
//    var goalDate = Date()
//
//    static let `default` = Profile(username: "g_kumar")
//
//    enum Season: String, CaseIterable, Identifiable {
//        case spring = "🌷"
//        case summer = "🌞"
//        case autumn = "🍂"
//        case winter = "☃️"
//
//        var id: String { self.rawValue }
//    }
//}
