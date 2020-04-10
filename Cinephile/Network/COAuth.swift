//
//  COAuth.swift
//  Cinephile
//
//  Created by omer ozkul on 10/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import Foundation
import OAuth2

extension APIClient {
    
    static func makeOAuth2CodeGrant() -> OAuth2CodeGrant {
        let oauth2 = OAuth2CodeGrant(settings: [
            "client_id": APIClient.clientId,
            "client_secret": APIClient.clientSecret,
            "authorize_uri": APIClient.hostUrl + APIClient.oauthUrl,
            "token_uri": APIClient.hostUrl + APIClient.tokenUrl,   // code grant only
            "redirect_uris": ["cinephile://authorize"],   // register your own "myapp" scheme in Info.plist
            //        "scope": "user repo:status",
            "keychain": true,         // if you DON'T want keychain integration
            ] as OAuth2JSON)
        
        
        oauth2.logger = OAuth2DebugLogger(.trace)
        return oauth2
    }
    
    func cleanOAuth2Data() {
        // delete credential from keychain
        self.oauth2.forgetTokens()
    
        // delete cookies to reload login page from Safari
        let storage = HTTPCookieStorage.shared
        storage.cookies?.forEach() { storage.deleteCookie($0) }
    }
}
