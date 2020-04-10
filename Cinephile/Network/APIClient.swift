//
//  APIClient.swift
//  Cinephile
//
//  Created by omer ozkul on 10/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import Foundation
import Alamofire
import OAuth2

// embed DataRequest which is a Alamofire library type
class CRequest {
    var request: DataRequest?
    
    init(request: DataRequest) {
        self.request = request
    }
}

final class RequestInterceptor: Alamofire.RequestInterceptor {

    let loader: OAuth2DataLoader
    
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

class APIClient {
    private var sessionManager: Alamofire.Session!
    var oauth2: OAuth2CodeGrant!

    static var shared: APIClient = {
        let apiClient = APIClient()
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 600 // 10min

        apiClient.oauth2 = APIClient.makeOAuth2CodeGrant()
        let interceptor = RequestInterceptor(oauth2: apiClient.oauth2)
        let session = Session(configuration: configuration, interceptor: interceptor)
        apiClient.sessionManager = session
        
        return apiClient
    }()
    
    var isNetworkReachable: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    private func getHeaders(contentType: String = "application/json") -> HTTPHeaders {
        var headers = HTTPHeaders()
        headers.add(HTTPHeader(name: "Content-Type", value: contentType))
        headers.add(HTTPHeader(name: "trakt-api-version", value: "2"))
        headers.add(HTTPHeader(name: "trakt-api-key", value: APIClient.clientId))
       return headers
    }
    
    func authorizeUser(successBlock: (() -> Void)? = nil,
                       failureBlock: ((_ error: NSError) -> Void)? = nil) -> Void {
        oauth2.authorize { (params, error) in
            guard error == nil else {
                print("Authorization was canceled or went wrong: \(String(describing: error))")
                failureBlock?(NSError())
                return
            }
            guard let params = params else { failureBlock?(NSError()); return }
            
            print("Authorized! Access token is in `oauth2.accessToken`")
            print("Authorized! Additional parameters: \(params)")
            successBlock?()
        }
    }
    
    func handleRedirectURL(_ redirect: URL) {
        oauth2.handleRedirectURL(redirect)
    }
    
    @discardableResult func doRequest(method: Alamofire.HTTPMethod, urlPath: String,
                                      parameters: [String: Any]? = nil,
                                      successHandler: @escaping () -> Void,
                                      failureHandler: @escaping () -> Void) -> CRequest? {
//        guard isNetworkReachable else { failureHandler(APIError.noInternetError()); return nil }
        // forget password is not associated to the api... so we don't add tha api version
        let encoding: ParameterEncoding = Alamofire.JSONEncoding.default
        let baseUrl = APIClient.hostUrl
        let urlComplete = urlPath.contains(baseUrl) ? urlPath : baseUrl + urlPath
        let headers = getHeaders()

        let request = sessionManager.request(urlComplete, method: method, parameters: parameters,
                                             encoding: encoding, headers: headers)
        
        // for forgot password there is an error "error Invalid value around character 0" because return html string...
        request.validate().responseJSON { (response) in
            print("\(method.rawValue.uppercased()): \(response.response?.statusCode ?? 0): " +
                "\(urlComplete)  \n  ----  \n response: \(response)")
//            self.manageResponse(response: response, successHandler: successHandler,
//                                failureHandler: failureHandler)
        }
        return CRequest(request: request)
    }
}
