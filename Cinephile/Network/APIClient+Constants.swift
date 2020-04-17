//
//  APIClient+constants.swift
//  Cinephile
//
//  Created by omer ozkul on 10/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import Foundation

extension APIClient {
    static let hostUrl = "https://api.trakt.tv/"
    static let imagesAPIHostUrl = "https://api.themoviedb.org/3/"
    static let imageHostUrl = "https://image.tmdb.org/t/p/original/"

    // MARK: - API URL

    // oauth
    static let oauthUrl = "oauth/authorize"
    static let tokenUrl = "oauth/token"

    // User
    static let userProfileUrl = "users/me"
    static let userProfileStatsUrl = "users/me/stats"

    // Movies
    static let moviesTrendingUrl = "movies/trending"
    static let moviesPopularUrl = "movies/popular"
    
    // Media Fanart.tv
    static let getMovieImagesUrl = "movie/%@/images"
    static let getSeriesImagesUrl = "tv"
}
