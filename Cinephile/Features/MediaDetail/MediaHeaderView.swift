//
//  MediaHeaderView.swift
//  Cinephile
//
//  Created by omer ozkul on 12/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import SwiftUI

struct MediaHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("omer")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipped()
                    .cornerRadius(10)
                VStack(alignment: .leading) {
                    Text("Article by")
                        .font(.custom("AvenirNext-Regular", size: 15))
                        .foregroundColor(.gray)
                    Text("Johne Doe")
                        .font(.custom("AvenirNext-Demibold", size: 15))
                }
            }
            .padding(.top, 20)
        }
    }
}

struct MediaHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MediaHeaderView()
    }
}
