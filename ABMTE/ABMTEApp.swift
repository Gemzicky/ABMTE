//
//  ABMTEApp.swift
//  ABMTE
//
//  Created by Maroš Gemzický on 02/01/2021.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
