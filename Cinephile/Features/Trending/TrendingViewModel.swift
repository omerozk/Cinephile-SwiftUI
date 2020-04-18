//
//  TrendingViewModel.swift
//  Cinephile
//
//  Created by omer ozkul on 17/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import Foundation

protocol Paginated {
    var page: Int { get set }
    var noMoreData: Bool { get set }
    var isLoading: Bool { get set }
    
    func loadNextPage()
}

extension TrendingView {
    class ViewModel: ObservableObject, Paginated {
        @Published private(set) var movies: [Movie] = []
        
        var enumeratedMovies: [EnumeratedSequence<[Movie]>.Element] {
            movies.enumerated().map({ $0 })
        }
        
        var page: Int = 1
        var noMoreData: Bool = true
        var isLoading: Bool = false
        
        init() {
            loadTrendingMovies()
        }
        
        private func loadTrendingMovies(overrideData: Bool = true) {
            self.isLoading = true
            APIClient.shared.trendingMovies(page: page, successBlock: { [weak self] results in
                self?.isLoading = false
                self?.noMoreData = results.count < APIClient.moviesPageLimit
                if overrideData {
                    self?.movies = results
                } else {
                    self?.movies.append(contentsOf: results)
                }
            }, failureBlock: { [weak self] in
                self?.isLoading = false
            })
        }
        
        func loadNextPage() {
            page += 1
            loadTrendingMovies(overrideData: false)
        }

    }
}
