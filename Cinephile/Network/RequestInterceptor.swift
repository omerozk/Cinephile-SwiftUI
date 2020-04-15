//
//  RequestInterceptor.swift
//  Cinephile
//
//  Created by omer ozkul on 15/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import Foundation
import Alamofire
import OAuth2

/// handle retry and add access token to each request
final class RequestInterceptor: Alamofire.RequestInterceptor {

    private let loader: OAuth2DataLoader
    
    init(oauth2: OAuth2) {
        loader = OAuth2DataLoader(oauth2: oauth2)
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        // if a API URLs
        guard urlRequest.url?.absoluteString.hasPrefix(APIClient.hostUrl) == true else {
            /// If the request requires authentication, we can directly return it as unmodified.
            return completion(.success(urlRequest))
        }

        var signedRequest = urlRequest
        try? signedRequest.sign(with: loader.oauth2)
        guard signedRequest.allHTTPHeaderFields?.keys.contains("Authorization") == true else {
            /// If the request requires authentication, we can directly return it as unmodified.
            return completion(.success(urlRequest))
        }

        completion(.success(signedRequest))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        guard let response = request.task?.response as? HTTPURLResponse, let urlRequest = request.request,
            response.statusCode == 401 else {
            /// The request did not fail due to a 401 Unauthorized response.
            /// Return the original error and don't retry the request.
            return completion(.doNotRetryWithError(error))
        }
        
        var dataRequest = OAuth2DataRequest(request: urlRequest, callback: { _ in })
        dataRequest.context = completion
        loader.enqueue(request: dataRequest)
        loader.attemptToAuthorize { (params, error) in
            guard error?.asOAuth2Error != .alreadyAuthorizing else {
                // Don't dequeue requests if we are waiting for other authorization request
                return
            }
            guard let params = params else {
                print("Authorization was canceled or went wrong: \(String(describing: error))")   // error will not be nil
                return completion(.doNotRetry)
            }
            print("Authorized! Access token is in `oauth2.accessToken`")
            print("Authorized! Additional parameters: \(params)")
            self.loader.dequeueAndApply { (req) in
                if let comp = req.context as? (RetryResult) -> Void {
                    comp(.retry)
                }
            }
        }
    }
}
