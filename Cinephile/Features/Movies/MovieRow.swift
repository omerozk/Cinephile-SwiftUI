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
    
    private var formatedDate: String {
        return movie.releaseDate.toString(dateFormat: "dd/MMM/yyyy")
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(movie.title)
                .font(.custom("HelveticaNeue-Bold", size: 24))
                .lineLimit(2)
            Text(movie.tagline)
                .font(.custom("HelveticaNeue", size: 14))
                .foregroundColor(Color.appPaleBlue)
            HStack {
                Text(self.formatedDate).textStyle(CSmallStyle())
                
                Spacer()
                Text("•").textStyle(CSmallStyle())
                Spacer()
                
                Text(movie.country.uppercased() + "  -  " + String(movie.runtime) + " min").textStyle(CSmallStyle())
                
                Spacer()
                Text("•").textStyle(CSmallStyle())
                Spacer()
                
                Text(String(format: "%.2f (%d votes)", movie.rating, movie.votes) ).textStyle(CSmallStyle())
            }
        }
        .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovieRow(movie: Movie())
        }
        .previewLayout(.fixed(width: 300, height: 80))
    }
}
