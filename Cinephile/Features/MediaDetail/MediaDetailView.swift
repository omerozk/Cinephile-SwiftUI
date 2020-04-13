//
//  MediaDetailView.swift
//  Cinephile
//
//  Created by omer ozkul on 09/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import SwiftUI

struct MediaDetailView: View {
    var movie: Movie
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ParallaxHeaderView(image: Image("omer"))
                MediaHeaderView(image: movie.image, title: movie.title, year: movie.year)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
                MediaDetailContentView(title: movie.title, runtime: movie.runtime, releaseDate: movie.releaseDate,
                                       content: movie.overview)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarTitle(Text(movie.title), displayMode: .inline)
    }
}

struct MediaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            MediaDetailView(movie: Movie())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
