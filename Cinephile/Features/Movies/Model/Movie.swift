//
//  Movie.swift
//  Cinephile
//
//  Created by omer ozkul on 09/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import Foundation
import SwiftUI
import CoreLocation

struct MediaIds: Decodable {
    enum CodingKeys: String, CodingKey {
        case slug, imdb, tmdb, tvdb
        // Map the JSON key "url" to the Swift property name "htmlLink"
        case id = "trakt"
    }

    let id: Int
    let slug: String?
    let imdb: String?
    let tmdb: Int?
    let tvdb: Int?
}

protocol Media: Identifiable {
    var ids: MediaIds { get }
    var id: Int { get }
}

struct Movie: Decodable {
    enum ReleaseStatus: String, Codable {
        case released, inProduction = "in production", postProduction = "post production", planned, rumored, canceled
        case other
    }
    
    let ids: MediaIds
    let title: String
    let year: Int
    
    // full
    let tagline: String
    let overview: String
    
    private let released: String
    var releaseDate: Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.date(from: released) ?? Date(timeIntervalSince1970: 0)
    }
    
    let runtime: Int
    let country: String
    private let trailer: String
    private let homepage: String
    let status: ReleaseStatus
    let rating: Float
    let votes: Int
    let commentCount: Int
    let updatedAt: Date
    let language: String
    let genres: [String]
    let certification: String
    
    /// mock model
    init() {
        ids = MediaIds(id: 1, slug: "deadpool", imdb: nil, tmdb: nil, tvdb: nil)
        title = "Deadpool"
        year = 2010
        tagline = "Witness the beginning of a happy ending"
        overview = "Deadpool tells the origin story of former Special Forces operative turned mercenary Wade Wilson, " +
            "who after being subjected to a rogue experiment that leaves him with accelerated healing powers, " +
            "adopts the alter ego Deadpool. Armed with his new abilities and a dark, twisted sense of humor, " +
        "Deadpool hunts down the man who nearly destroyed his life"
        released = "2016-02-12"
        runtime = 108
        country = "us"
        trailer = "http://youtube.com/watch?v=FyKWUTwSYAs"
        homepage = "http://www.foxmovies.com/movies/deadpool"
        status = ReleaseStatus(rawValue: "released") ?? .other
        rating = 8.32655
        votes = 85950
        commentCount = 198
        updatedAt = Date()
        language = "en"
        genres = ["action","adventure","comedy","superhero"]
        certification = "R"
    }
}

extension Movie {
    var image: Image {
        Image("omer")
//        ImageStore.shared.image(name: imageName)
    }
}

// "title": "Deadpool"
// "year": 2020
//"tagline\":\"Witness the beginning of a happy ending\",
//\"overview\":\"Deadpool tells the origin story of former Special Forces operative turned mercenary Wade Wilson, who after being subjected to a rogue experiment that leaves him with accelerated healing powers, adopts the alter ego Deadpool. Armed with his new abilities and a dark, twisted sense of humor, Deadpool hunts down the man who nearly destroyed his life.\",
//\"released\":\"2016-02-12\",
//\"runtime\":108,
//\"country\":\"us\",
//
//\"trailer\":\"http://youtube.com/watch?v=FyKWUTwSYAs\",
//\"homepage\":\"http://www.foxmovies.com/movies/deadpool\",
//\"status\":\"released\",
//\"rating\":8.32655,
//\"votes\":85950,
//\"comment_count\":198,
//\"updated_at\":\"2020-03-31T08:05:09.000Z\",
//\"language\":\"en\",
//\"available_translations\":[\"ar\",\"bg\",\"bs\",\"cs\",\"da\",\"de\",\"el\",\"en\",\"es\",\"fa\",\"fi\",\"fr\",\"he\",\"hr\",\"hu\",\"id\",\"it\",\"ja\",\"ka\",\"ko\",\"ky\",\"lt\",\"lv\",\"mk\",\"ml\",\"nb\",\"nl\",\"no\",\"pl\",\"ps\",\"pt\",\"ro\",\"ru\",\"sk\",\"sl\",\"sr\",\"sv\",\"th\",\"tr\",\"uk\",\"ur\",\"uz\",\"vi\",\"xx\",\"zh\"],
//\"genres\":[\"action\",\"adventure\",\"comedy\",\"superhero\"],
//\"certification\":\"R\"}

