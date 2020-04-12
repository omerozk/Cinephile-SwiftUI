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

    var id: Int
    var slug: String?
    var imdb: String?
    var tmdb: Int?
    var tvdb: Int?
}

protocol Media: Identifiable {
    var ids: MediaIds { get }
    var id: Int { get }
}

struct Movie: Decodable {
    var ids: MediaIds
//    var id: Int { ids.id }
    var title: String
    var year: Int
}

extension Movie {
    var image: Image {
        Image("omer")
//        ImageStore.shared.image(name: imageName)
    }
}
