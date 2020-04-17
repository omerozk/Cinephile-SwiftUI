//
//  MediaDetailView.swift
//  Cinephile
//
//  Created by omer ozkul on 09/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import SwiftUI

struct MediaDetailView: View {
    var viewModel: ViewModel
//    var movie: Movie
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ParallaxHeaderView(imageUrl: viewModel.imageUrl)
                MediaDetailContentView(title: viewModel.movie.title, runtime: viewModel.movie.runtime,
                                       releaseDate: viewModel.movie.releaseDate, content: viewModel.movie.overview)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            }
        }
        .navigationBarTitle(Text(viewModel.movie.title), displayMode: .inline)
    }
}

struct MediaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            MediaDetailView(viewModel: MediaDetailView.ViewModel(movie: Movie()))
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
