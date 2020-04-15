//
//  APIClient+user.swift
//  Cinephile
//
//  Created by omer ozkul on 10/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import Foundation

extension APIClient {
    
    func authorize(successBlock: (() -> Void)? = nil, failureBlock: ((_ error: NSError) -> Void)? = nil) -> Void {
        APIClient.shared.authorizeApiClient(successBlock: successBlock, failureBlock: failureBlock)
    }
}
