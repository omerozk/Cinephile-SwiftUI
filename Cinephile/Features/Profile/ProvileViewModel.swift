//
//  ProvileViewModel.swift
//  Cinephile
//
//  Created by omer ozkul on 15/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import Foundation

extension ProfileView {
    class ViewModel: ObservableObject {
        @Published private(set) var user: User?
        
        init() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
                self.loadUser()
            })
        }
        
        func loadUser() {
            APIClient.shared.getUserInfo(successBlock: { [weak self] user in
                self?.user = user
            }, failureBlock: {
                
            })
        }

    }
}
