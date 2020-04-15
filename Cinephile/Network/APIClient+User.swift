//
//  APIClient+user.swift
//  Cinephile
//
//  Created by omer ozkul on 10/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import Foundation

extension APIClient {
    
    func getUserInfo(successBlock: ((User) -> Void)? = nil, failureBlock: (() -> Void)? = nil) -> Void {
        let params = ["extended": "full"]
        APIClient.shared.doRequest(method: .get, urlPath: APIClient.userProfileUrl, parameters: params,
                                   successHandler: { data in
                                    guard let user = (try? APIClient.shared.decoder.decode(User.self, from: data)) else {
                                        failureBlock?(); return 
                                    }
                                    successBlock?(user)
        }, failureHandler: { failureBlock?() })
    }
}
