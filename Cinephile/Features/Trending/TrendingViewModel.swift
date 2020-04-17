//
//  TrendingViewModel.swift
//  Cinephile
//
//  Created by omer ozkul on 17/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import Foundation

extension TrendingView {
    class ViewModel: ObservableObject {
        @Published private(set) var movies: [Movie] = []
        
        init() {
            loadTrendingMovies()
        }
        
        func loadTrendingMovies() {
            APIClient.shared.trendingMovies(successBlock: { [weak self] results in
                self?.movies = results
            }, failureBlock: {
                
            })
        }

    }
}
