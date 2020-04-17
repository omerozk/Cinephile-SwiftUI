//
//  TrendingView.swift
//  Cinephile
//
//  Created by omer ozkul on 17/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import SwiftUI

struct TrendingView: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.enumeratedMovies, id: \.element.ids.id, rowContent: { index, movie in
                NavigationLink(destination: MediaDetailView(movie: movie)) {
                    MovieRow(movie: movie)
                }.onAppear {
                    self.getNextPageIfNecessary(index: index, totalItems: self.viewModel.enumeratedMovies.count)
                }
            })
            .navigationBarTitle(Text("Trending Movies"))
        }
    }
    
    private func getNextPageIfNecessary(index: Int, totalItems: Int) {
        guard !self.viewModel.noMoreData && index == totalItems - 5 else { return }
        self.viewModel.loadNextPage()
    }
}

struct TrendingView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingView()
    }
}
