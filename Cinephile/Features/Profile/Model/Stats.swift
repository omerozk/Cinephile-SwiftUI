//
//  Stats.swift
//  Cinephile
//
//  Created by omer ozkul on 15/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import Foundation

struct Stats: Decodable {
    struct Medias: Decodable {
        let plays: Int
        let watched: Int
        let minutes: Int
        var formatedTime: String { minutesToDaysHoursMinutes(minutes: minutes) }
        let collected: Int
        let ratings: Int
        let comments: Int
        
        private func minutesToDaysHoursMinutes (minutes : Int) -> String {
            let seconds = minutes * 60
            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.day, .hour, .minute]
            formatter.unitsStyle = .abbreviated
            return formatter.string(from: TimeInterval(seconds)) ?? "0"
        }

    }
    
    struct Shows: Decodable {
        let watched: Int
        let collected: Int
        let ratings: Int
        let comments: Int
    }

    struct Seasons: Decodable {
        let ratings: Int
        let comments: Int
    }

    struct Network: Decodable {
        let friends: Int
        let followers: Int
        let following: Int
    }

    struct Ratings: Decodable {
        let total: Int
        let distribution: [String: Int]
    }

    let movies: Medias
    let shows: Shows
    let seasons: Seasons
    let episodes: Medias
    let network: Network
    let ratings: Ratings
    
    /// mock model
    init() {
        movies = Medias(plays: 13, watched: 2, minutes: 12939, collected: 2, ratings: 2, comments: 2)
        shows = Shows(watched: 2, collected: 1, ratings: 13, comments: 123)
        seasons = Seasons(ratings: 2, comments: 31)
        episodes = Medias(plays: 123123, watched: 123, minutes: 123, collected: 123213, ratings: 1231, comments: 12312)
        network = Network(friends: 123, followers: 1233, following: 2112)
        ratings = Ratings(total: 123, distribution: ["2": 23, "7": 1, "10": 9]) // "note": quantite
    }
}

//{
//  "movies": {
//    "plays": 155,
//    "watched": 114,
//    "minutes": 15650,
//    "collected": 933,
//    "ratings": 256,
//    "comments": 28
//  },
//  "shows": {
//    "watched": 16,
//    "collected": 7,
//    "ratings": 63,
//    "comments": 20
//  },
//  "seasons": {
//    "ratings": 6,
//    "comments": 1
//  },
//  "episodes": {
//    "plays": 552,
//    "watched": 534,
//    "minutes": 17330,
//    "collected": 117,
//    "ratings": 64,
//    "comments": 14
//  },
//  "network": {
//    "friends": 1,
//    "followers": 4,
//    "following": 11
//  },
//  "ratings": {
//    "total": 389,
//    "distribution": {
//      "1": 18,
//      "2": 1,
//      "3": 4,
//      "4": 1,
//      "5": 10,
//      "6": 9,
//      "7": 37,
//      "8": 37,
//      "9": 57,
//      "10": 215
//    }
//  }
//}
