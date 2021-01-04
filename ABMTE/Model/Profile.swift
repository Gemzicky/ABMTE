//
//  Profile.swift
//  ABMTE
//
//  Created by Maroš Gemzický on 02/01/2021.
//

import Foundation

class Profile: ObservableObject {
    var username: String
    var prefersNotifications: Bool
    var seasonalPhoto: Season
    var goalDate: Date

    static let `default` = Profile(username: "Anonymous", prefersNotifications: true, seasonalPhoto: Season.spring, goalDate: Date())

    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"

        var id: String { self.rawValue }
    }

    init(username: String, prefersNotifications: Bool, seasonalPhoto: Season, goalDate: Date) {
        self.username = UserDefaults.standard.string(forKey: "username") ?? "Anonymous"
        self.prefersNotifications = UserDefaults.standard.bool(forKey: "prefersNotifications")
        if UserDefaults.standard.string(forKey: "seasonalPhotoId") != nil {
            self.seasonalPhoto = Profile.Season(rawValue: UserDefaults.standard.string(forKey: "seasonalPhotoId")!)!
        } else {
            self.seasonalPhoto = Season.spring
        }
        self.goalDate = UserDefaults.standard.object(forKey: "goalDate") as? Date ?? Date()
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
