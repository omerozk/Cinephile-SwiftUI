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

class APIClient {
    private var sessionManager: Alamofire.Session!
    private(set) var oauth2: OAuth2CodeGrant!
    
    var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
        return decoder
    }

    static var shared: APIClient = {
        let apiClient = APIClient()
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 600 // 10min

        // oauth2
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
    
    @discardableResult func doRequest(method: Alamofire.HTTPMethod, urlPath: String,
                                      parameters: [String: Any]? = nil,
                                      successHandler: @escaping (Data) -> Void,
                                      failureHandler: @escaping () -> Void) -> CRequest? {
//        guard isNetworkReachable else { failureHandler(APIError.noInternetError()); return nil }
        let baseUrl = APIClient.hostUrl
        let urlComplete = urlPath.contains(baseUrl) ? urlPath : baseUrl + urlPath
        let headers = getHeaders()

        let request = sessionManager.request(urlComplete, method: method, parameters: parameters, headers: headers)
        
        request.validate().responseString { (response) in
            print("\(method.rawValue.uppercased()): \(response.response?.statusCode ?? 0): " +
                "\(urlComplete)  \n  ----  \n response: \(response)")
            self.manageResponse(response: response, successHandler: successHandler,
                                failureHandler: failureHandler)
        }
        return CRequest(request: request)
    }
    
    
    @discardableResult func doPublicRequest(method: Alamofire.HTTPMethod, urlPath: String,
                                            parameters: [String: Any]? = nil,
                                            successHandler: @escaping (Data) -> Void,
                                            failureHandler: @escaping () -> Void) -> CRequest? {
        //        guard isNetworkReachable else { failureHandler(APIError.noInternetError()); return nil }
        let headers = HTTPHeaders([HTTPHeader(name: "Content-Type", value: "application/json")])

        let request = sessionManager.request(urlPath, method: method, parameters: parameters, headers: headers)
        
        request.validate().responseString { (response) in
            print("PUblic Req: \(method.rawValue.uppercased()): \(response.response?.statusCode ?? 0): " +
                "\(urlPath)  \n  ----  \n response: \(response)")
            self.manageResponse(response: response, successHandler: successHandler,
                                failureHandler: failureHandler)
        }
        return CRequest(request: request)
    }
    
    private func manageResponse(response: AFDataResponse<String>,
                                successHandler: @escaping (Data) -> Void,
                                failureHandler: @escaping () -> Void) {
        let res = response.value ?? ""
        guard let data = res.data(using: .utf8) else { return failureHandler() }
        successHandler(data)
    }
}
