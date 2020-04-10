//
//  APIClient.swift
//  Cinephile
//
//  Created by omer ozkul on 10/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import Foundation
import Alamofire

class CRequest {
    var request: DataRequest?
    
    init(request: DataRequest) {
        self.request = request
    }
}

class APIClient {
    private var sessionManager: Alamofire.Session!
    
    static var shared: APIClient = {
        let apiClient = APIClient()
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 600 // 10min

        apiClient.sessionManager = Session(configuration: configuration)
        return apiClient
    }()
    
    var isNetworkReachable: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    private func getHeaders(contentType: String = "application/json") -> HTTPHeaders {
        var headers = HTTPHeaders()
        headers.add(HTTPHeader(name: "Content-Type", value: contentType))
       return headers
    }
    
    @discardableResult func doRequest(method: Alamofire.HTTPMethod, urlPath: String,
                                      parameters: [String: Any]? = nil,
                                      successHandler: @escaping () -> Void,
                                      failureHandler: @escaping () -> Void) -> CRequest? {
//        guard isNetworkReachable else { failureHandler(APIError.noInternetError()); return nil }
        // forget password is not associated to the api... so we don't add tha api version
        let encoding: ParameterEncoding = Alamofire.JSONEncoding.default
        let baseUrl = APIClient.hostURL
        let urlComplete = urlPath.contains(baseUrl) ? urlPath : baseUrl + urlPath
        let headers = getHeaders()

        let request = sessionManager.request(urlComplete, method: method, parameters: parameters,
                                             encoding: encoding, headers: headers)
        
        // for forgot password there is an error "error Invalid value around character 0" because return html string...
        request.responseJSON { (response) in
            print("\(method.rawValue.uppercased()): \(response.response?.statusCode ?? 0): " +
                "\(urlComplete)  \n  ----  \n response: \(response)")
//            self.manageResponse(response: response, successHandler: successHandler,
//                                failureHandler: failureHandler)
        }
        return CRequest(request: request)
    }
}
