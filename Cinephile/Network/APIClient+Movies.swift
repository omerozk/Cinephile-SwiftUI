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
        APIClient.shared.doRequest(method: .get, urlPath: APIClient.moviesTrendingUrl, successHandler: {
            successBlock?()
        }, failureHandler: { failureBlock?() })
    }
}
