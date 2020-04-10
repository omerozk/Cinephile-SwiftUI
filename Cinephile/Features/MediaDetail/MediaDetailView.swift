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
        Text("Detail")
            .navigationBarTitle(Text(movie.name), displayMode: .inline)
    }

}

struct MediaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            MediaDetailView(movie: Movie(id: 0, name: "lol"))
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
