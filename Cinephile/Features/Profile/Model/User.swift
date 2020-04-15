//
//  User.swift
//  Cinephile
//
//  Created by omer ozkul on 15/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import Foundation

struct Images: Decodable {
    struct Avatar: Decodable {
        let full: String
    }
    
    let avatar: Avatar?
}

struct UserIds: Decodable {
    let slug: String
}

struct User: Decodable {
    enum Gender: String, Codable {
        case male, female
    }
    
    enum CodingKeys: String, CodingKey {
        case ids, username, name, vip, vipEp, joinedAt, location, about, gender, age, images
        // Map the JSON key "url" to the Swift property name "htmlLink"
        case isPrivate = "private"
    }
    
    private let ids: UserIds
    var id: String { ids.slug }
    let username: String
    let name: String

    let isPrivate: Bool
    let vip: Bool
    let vipEp: Bool

    let joinedAt: Date
    let location: String
    let about: String
    let gender: Gender
    let age: Int
    let images: Images?
    
    /// mock model
    init() {
        ids = UserIds(slug: "test")
        username = "testUser"
        name = "Test User"
        isPrivate = false
        vip = false
        vipEp = false
        joinedAt = Date()
        location = "LA"
        about = "just some test data"
        gender = .male
        age = 20
        images = nil
    }
}

//{
//  "username": "sean",
//  "private": false,
//  "name": "Sean Rudford",
//  "vip": true,
//  "vip_ep": true,
//  "ids": {
//    "slug": "sean"
//  }
//"joined_at": "2010-09-25T17:49:25.000Z",
//"location": "SF",
//"about": "I have all your cassette tapes.",
//"gender": "male",
//"age": 35,
//"images": {
//  "avatar": {
//    "full": "https://walter-dev.trakt.tv/images/users/000/000/001/avatars/large/0ba3f72910.jpg"
//  }
//}
