//
//  UserSettings.swift
//  ABMTE
//
//  Created by Maroš Gemzický on 03/01/2021.
//

import Foundation
import Combine

class UserSettings: ObservableObject {
    @Published var profile: Profile {
        didSet {
            UserDefaults.standard.set(profile.username, forKey: "username")
            UserDefaults.standard.set(profile.prefersNotifications, forKey: "prefersNotifications")
            UserDefaults.standard.set(profile.seasonalPhoto, forKey: "seasonalPhoto")
            UserDefaults.standard.set(profile.goalDate, forKey: "goalDate")
        }
    }

    init() {
        let username = UserDefaults.standard.object(forKey: "username") as? String ?? ""
        let prefersNotifications = UserDefaults.standard.object(forKey: "prefersNotifications") as? Bool ?? true
        let seasonalPhoto = UserDefaults.standard.object(forKey: "seasonalPhoto") as? Profile.Season ?? Profile.Season.spring
        let goalDate = UserDefaults.standard.object(forKey: "goalDate") as? Date ?? Date()
        self.profile = Profile (username: username, prefersNotifications: prefersNotifications, seasonalPhoto: seasonalPhoto, goalDate: goalDate)
    }

    func savedProfile() -> Profile {
//        return Profile (username: profile.username, prefersNotifications: profile.prefersNotifications, seasonalPhoto: profile.seasonalPhoto, goalDate: profile.goalDate)
        return profile
    }

    static let `default` = savedProfile
}
