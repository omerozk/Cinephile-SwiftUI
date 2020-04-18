//
//  MediaDetailContentView.swift
//  Cinephile
//
//  Created by omer ozkul on 12/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import SwiftUI

struct MediaDetailContentView: View {
    let movie: Movie
    
    private var formatedDate: String {
        return movie.releaseDate.toString(dateFormat: "E, dd MMM yyyy")
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(movie.title)
                .font(.custom("HelveticaNeue-Bold", size: 30))
                .lineLimit(nil)
                .padding(.top, 10)
            Text("\(formatedDate)   •   \(movie.runtime) min")
                .font(.custom("HelveticaNeue", size: 15))
                .foregroundColor(.gray)
                .padding(.top, 4)
            Text(movie.genres.reduce(String(), {
                if $0 == "" { return $0 + $1.capitalized }
                return  "\($0)  -  \($1.capitalized)"
            }))
                .lineLimit(nil)
                .font(.custom("HelveticaNeue", size: 15))
                .foregroundColor(.gray)
                .padding(.top, 4)
            Text(movie.overview)
                .font(.custom("HelveticaNeue", size: 20))
                .lineLimit(nil)
                .padding(.vertical, 20)
        }
    }
}

struct MediaDetailContentView_Previews: PreviewProvider {
    static var previews: some View {
        return MediaDetailContentView(movie: Movie())
    }
}
