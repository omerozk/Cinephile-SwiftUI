//
//  MoviesView.swift
//  Cinephile
//
//  Created by omer ozkul on 09/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import SwiftUI

struct MoviesView: View {
    
    @ObservedObject var viewModel: MoviesViewModel

    var body: some View {
        NavigationView {
            List(viewModel.movies, id: \.ids.id, rowContent: { movie in
                NavigationLink(destination: MediaDetailView(movie: movie)) {
                    MovieRow(movie: movie)
                }
            })
            .navigationBarTitle(Text("Movies"))
                .onAppear {
                    self.viewModel.loadPopularMovies()
            }
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView(viewModel: MoviesView.MoviesViewModel())
    }
}
