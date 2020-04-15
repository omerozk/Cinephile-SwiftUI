//
//  MediaDetailContentView.swift
//  Cinephile
//
//  Created by omer ozkul on 12/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import SwiftUI

struct MediaDetailContentView: View {
    let title: String
    let runtime: Int
    let releaseDate: Date
    let content: String
    
    private var formatedDate: String {
        return releaseDate.toString(dateFormat: "E, dd MMM yyyy")
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.custom("AvenirNext-Bold", size: 30))
                .lineLimit(nil)
                .padding(.top, 10)
            Text("\(formatedDate)   •   \(runtime) min")
                .font(.custom("AvenirNext-Regular", size: 15))
                .foregroundColor(.gray)
                .padding(.top, 4)
            Text(content)
                .font(.custom("AvenirNext-Regular", size: 20))
                .lineLimit(nil)
                .padding(.top, 20)
        }
    }
}

struct MediaDetailContentView_Previews: PreviewProvider {
    static var previews: some View {
        let movie = Movie()
        return MediaDetailContentView(title: movie.title, runtime: movie.runtime,
                                      releaseDate: movie.releaseDate, content: movie.overview)
    }
}
