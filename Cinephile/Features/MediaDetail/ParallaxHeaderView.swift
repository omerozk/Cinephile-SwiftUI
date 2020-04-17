//
//  ParallaxHeaderView.swift
//  Cinephile
//
//  Created by omer ozkul on 12/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

// https://blckbirds.com/post/stretchy-header-and-parallax-scrolling-in-swiftui/
struct ParallaxHeaderView: View {
    var imageUrl: URL?
    var headerHeight: CGFloat = 300
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                if geometry.frame(in: .global).minY <= 0 {
                    KFImage(self.imageUrl)
                        .placeholder({ Image("media-placeholder") })
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(y: geometry.frame(in: .global).minY/7)
                        .clipped()
                } else {
                    KFImage(self.imageUrl)
                        .placeholder({ Image("media-placeholder") })
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height +
                            geometry.frame(in: .global).minY)
                        .clipped()
                        .offset(y: -geometry.frame(in: .global).minY)
                }
            }
        }
        .frame(height: headerHeight)
    }
}

struct ParallaxHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ParallaxHeaderView(imageUrl: URL(string: "https://image.tmdb.org/t/p/original/emesWTuGpaLOUfs0sZ6UFnn1ZHm.jpg"))
    }
}
