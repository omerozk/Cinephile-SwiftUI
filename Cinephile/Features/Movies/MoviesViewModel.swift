//
//  MoviesViewModel.swift
//  Cinephile
//
//  Created by omer ozkul on 12/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import Foundation

extension MoviesView {
    class MoviesViewModel: ObservableObject {
        @Published private(set) var movies: [Movie] = []
        
        func loadPopularMovies() {
            APIClient.shared.popularMovies(successBlock: { [weak self] results in
                self?.movies = results
            }, failureBlock: {
                
            })
        }
    }
}
