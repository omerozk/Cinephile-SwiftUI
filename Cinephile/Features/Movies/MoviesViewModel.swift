//
//  MoviesViewModel.swift
//  Cinephile
//
//  Created by omer ozkul on 12/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import Foundation

extension MoviesView {
    class ViewModel: ObservableObject, Paginated {
        
        @Published private(set) var movies: [Movie] = []
        
        var enumeratedMovies: [EnumeratedSequence<[Movie]>.Element] {
            movies.enumerated().map({ $0 })
        }

        var page: Int = 1
        var noMoreData: Bool = true
        var isLoading: Bool = false

        func loadPopularMovies(overrideData: Bool = true) {
            self.isLoading = true
            APIClient.shared.popularMovies(successBlock: { [weak self] results in
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
            loadPopularMovies(overrideData: false)
        }
    }
}
