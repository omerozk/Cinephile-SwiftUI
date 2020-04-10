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

struct MediaIds {
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

struct Movie: Media {
    var ids: MediaIds
    var id: Int { ids.id }
    var title: String
    var year: Int
    
//    init(year: Int, title: String) {
//        self.title = title
//        self.year = year
//    }
}

extension Movie {
    var image: Image {
        Image("omer")
//        ImageStore.shared.image(name: imageName)
    }
}
