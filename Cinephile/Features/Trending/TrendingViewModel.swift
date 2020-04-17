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
        
        init() {
            loadTrendingMovies()
        }
        
        private func loadTrendingMovies(overrideData: Bool = true) {
            let limit = 20
            
            APIClient.shared.trendingMovies(page: page, successBlock: { [weak self] results in
                self?.noMoreData = results.count < limit
                if overrideData {
                    self?.movies = results
                } else {
                    self?.movies.append(contentsOf: results)
                }
            }, failureBlock: {
                
            })
        }
        
        func loadNextPage() {
            page += 1
            loadTrendingMovies(overrideData: false)
        }

    }
}
