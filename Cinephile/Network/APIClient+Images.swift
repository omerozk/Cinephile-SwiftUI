//
//  APIClient+Images.swift
//  Cinephile
//
//  Created by omer ozkul on 17/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import Foundation

extension APIClient {

    func getMovieImageUrl(tmdbId: Int,
                          successBlock: ((URL?) -> Void)? = nil, failureBlock: (() -> Void)? = nil) -> Void {
        let path = APIClient.imagesAPIHostUrl + String(format: APIClient.getMovieImagesUrl, String(tmdbId))
        let params: [String: String] = ["api_key": APIClient.tmdbApiKey, "language": "en"]
        APIClient.shared.doPublicRequest(method: .get, urlPath: path, parameters: params,
                                         successHandler: { data in
                                            let decoder = APIClient.shared.decoder
                                            
                                            guard let items = (try? decoder.decode(MediaImages.self, from: data)),
                                                let path = items.posters.first?.filePath,
                                                let url = URL(string: APIClient.imageHostUrl + path) else {
                                                successBlock?(nil)
                                                return
                                            }
                                            successBlock?(url)
        }, failureHandler: { failureBlock?() })
    }
}
