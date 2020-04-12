//
//  MediaDetailContentView.swift
//  Cinephile
//
//  Created by omer ozkul on 12/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import SwiftUI

struct MediaDetailContentView: View {
    let articleContent =
    """
    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
    At vero eos et accusam et justo duo dolores et ea rebum.
    Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
    At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
    """

    var body: some View {
        VStack(alignment: .leading) {
            Text("Lorem ipsum dolor sit amet")
                .font(.custom("AvenirNext-Bold", size: 30))
                .lineLimit(nil)
                .padding(.top, 10)
            Text("3 min read • 22. November 2019")
                .font(.custom("AvenirNext-Regular", size: 15))
                .foregroundColor(.gray)
                .padding(.top, 10)
            Text(articleContent)
                .font(.custom("AvenirNext-Regular", size: 20))
                .lineLimit(nil)
                .padding(.top, 30)
        }
    }
}

struct MediaDetailContentView_Previews: PreviewProvider {
    static var previews: some View {
        MediaDetailContentView()
    }
}
