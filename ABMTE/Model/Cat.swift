//
//  Cat.swift
//  ABMTE
//
//  Created by Maroš Gemzický on 04/01/2021.
//

import Foundation

struct Cat: Codable, Hashable {
    var status: Status
    var type: String
    var deleted: Bool
    var _id: String
    var user: String
    var text: String
    var __v: Int
    var source: String
    var updatedAt: String
    var createdAt: String
    var used: Bool
    struct Status: Codable, Hashable {
        var verified: Bool
        var sentCount: Int
    }
}
