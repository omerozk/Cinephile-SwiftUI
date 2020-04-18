//
//  MoviesView.swift
//  Cinephile
//
//  Created by omer ozkul on 09/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import SwiftUI

struct MoviesView: View {
    
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        NavigationView {
            // use offset because \.element.ids.id can be duplicate (some movies are sent twice)
            List(viewModel.enumeratedMovies, id: \.offset, rowContent: { index, movie in
                NavigationLink(destination: MediaDetailView(viewModel: MediaDetailView.ViewModel(movie: movie))) {
                    MovieRow(movie: movie)
                }.onAppear {
                    self.getNextPageIfNecessary(index: index, totalItems: self.viewModel.enumeratedMovies.count)
                }
            })
            .navigationBarTitle(Text("Movies"))
                .onAppear {
                    self.viewModel.loadPopularMovies()
            }
        }
    }
    
    private func getNextPageIfNecessary(index: Int, totalItems: Int) {
        guard !self.viewModel.noMoreData && index == totalItems - 5 else { return }
        self.viewModel.loadNextPage()
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView(viewModel: MoviesView.ViewModel())
    }
}
