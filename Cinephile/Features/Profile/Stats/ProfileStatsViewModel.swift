//
//  ProfileStatsViewModel.swift
//  Cinephile
//
//  Created by omer ozkul on 16/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import Foundation

extension ProfileStatsView {
    class ViewModel: ObservableObject {
        @Published private(set) var stats: Stats?

        init() {
            loadStats()
        }
        
        private func loadStats() {
            APIClient.shared.getUserStats(successBlock: { [weak self] stats in
                self?.stats = stats
                }, failureBlock: {})
        }
    }
}
