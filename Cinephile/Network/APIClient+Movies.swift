//
//  APIClient+Movies.swift
//  Cinephile
//
//  Created by omer ozkul on 10/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import Foundation

extension APIClient {
    static let moviesPageLimit = 20
    
    func trendingMovies(page: Int = 1,
                        successBlock: (([Movie]) -> Void)? = nil, failureBlock: (() -> Void)? = nil) -> Void {
        let params: [String : Any] = ["page": page, "limit": APIClient.moviesPageLimit, "extended": "full"]
        APIClient.shared.doRequest(method: .get, urlPath: APIClient.moviesTrendingUrl, parameters: params,
                                   successHandler: { data in
                                    let trend: [Trending] = (try? APIClient.shared.decoder.decode([Trending].self,
                                                                                                  from: data)) ?? []
                                    successBlock?(trend.compactMap({ $0.movie }))
        }, failureHandler: { failureBlock?() })
    }
    
    func popularMovies(successBlock: (([Movie]) -> Void)? = nil, failureBlock: (() -> Void)? = nil) -> Void {
        let params: [String : Any] = ["page": 1, "limit": APIClient.moviesPageLimit, "extended": "full"]
        APIClient.shared.doRequest(method: .get, urlPath: APIClient.moviesPopularUrl, parameters: params,
                                   successHandler: { data in
                                    let movies: [Movie] = (try? APIClient.shared.decoder.decode([Movie].self,
                                                                                                from: data)) ?? []
                                    successBlock?(movies)
        }, failureHandler: { failureBlock?() })
    }
}
