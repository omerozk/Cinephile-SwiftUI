//
//  MediaHeaderView.swift
//  Cinephile
//
//  Created by omer ozkul on 12/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import SwiftUI

struct MediaHeaderView: View {
    var image: Image
    var title: String
    var year: Int

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                self.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipped()
                    .cornerRadius(10)
                VStack(alignment: .leading) {
                    Text(self.title)
                        .font(.custom("AvenirNext-Demibold", size: 20))
                        .lineLimit(2)
                    Text("Release date: \(String(self.year))")
                        .font(.custom("AvenirNext-Regular", size: 13))
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct MediaHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MediaHeaderView(image: Image("omer"), title: "Batman", year: 2005)
            .previewLayout(.sizeThatFits)
    }
}
