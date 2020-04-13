//
//  APIClient+Movies.swift
//  Cinephile
//
//  Created by omer ozkul on 10/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import Foundation

extension APIClient {
    
    func trendingMovies(successBlock: (() -> Void)? = nil, failureBlock: (() -> Void)? = nil) -> Void {
        APIClient.shared.doRequest(method: .get, urlPath: APIClient.moviesTrendingUrl, successHandler: { data in
            successBlock?()
        }, failureHandler: { failureBlock?() })
    }
    
    func popularMovies(successBlock: (([Movie]) -> Void)? = nil, failureBlock: (() -> Void)? = nil) -> Void {
        let params: [String : Any] = ["page": 1, "limit": 20, "extended": "full"]
        APIClient.shared.doRequest(method: .get, urlPath: APIClient.moviesPopularUrl, parameters: params,
                                   successHandler: { data in
                                    let movies: [Movie] = (try? APIClient.shared.decoder.decode([Movie].self, from: data)) ?? []
                                    successBlock?(movies)
        }, failureHandler: { failureBlock?() })
    }
}
