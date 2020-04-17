//
//  MediaDetailViewModel.swift
//  Cinephile
//
//  Created by omer ozkul on 17/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import Foundation

extension MediaDetailView {
    class ViewModel: ObservableObject {
        var movie: Movie
        
        @Published private(set) var imageUrl: URL?
        
        init(movie: Movie) {
            self.movie = movie
            getImageUrl()
        }
        
        private func getImageUrl() {
            guard let id = self.movie.ids.tmdb else { return }
            APIClient.shared.getMovieImageUrl(tmdbId: id, successBlock: { (url) in
                self.imageUrl = url
            }, failureBlock: {
                
            })
        }
    }
}
