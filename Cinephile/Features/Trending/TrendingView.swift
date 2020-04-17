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
            List(viewModel.movies, id: \.ids.id, rowContent: { movie in
                NavigationLink(destination: MediaDetailView(movie: movie)) {
                    MovieRow(movie: movie)
                }
            })
            .navigationBarTitle(Text("Movies"))
        }
    }
}

struct TrendingView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingView()
    }
}
