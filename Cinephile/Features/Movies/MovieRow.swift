//
//  MovieRow.swift
//  Cinephile
//
//  Created by omer ozkul on 09/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import SwiftUI

struct MovieRow: View {
    var movie: Movie
    
    var body: some View {
        HStack {
            movie.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(movie.name)
            Spacer()
        }
        .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovieRow(movie: moviesList[0])
            MovieRow(movie: moviesList[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
