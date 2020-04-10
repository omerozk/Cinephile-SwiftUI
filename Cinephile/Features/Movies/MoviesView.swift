//
//  MoviesView.swift
//  Cinephile
//
//  Created by omer ozkul on 09/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import SwiftUI

struct MoviesView: View {
    var body: some View {
        NavigationView {
            List(moviesList, rowContent: { movie in
                NavigationLink(destination: MediaDetailView(movie: movie)) {
                    MovieRow(movie: movie)
                }
            })
            .navigationBarTitle(Text("Movies"))
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
