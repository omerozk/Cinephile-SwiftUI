//
//  MediaImages.swift
//  Cinephile
//
//  Created by omer ozkul on 17/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import Foundation

struct MediaImages: Decodable {
    struct Poster: Decodable {
        let filePath: String
        let height: Int
        let width: Int
    }
    
    let id: Int
    let posters: [Poster]
}

//{
//     "aspect_ratio": 0.6666666666666666,
//     "file_path": "/btnl50ZDJDSCal2NLQIYWw0XxvH.jpg",
//     "height": 1500,
//     "iso_639_1": "en",
//     "vote_average": 5.384,
//     "vote_count": 2,
//     "width": 1000
//}
