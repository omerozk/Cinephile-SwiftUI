//
//  ParallaxHeaderView.swift
//  Cinephile
//
//  Created by omer ozkul on 12/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import SwiftUI

// https://blckbirds.com/post/stretchy-header-and-parallax-scrolling-in-swiftui/
struct ParallaxHeaderView: View {
    var image: Image
    var headerHeight: CGFloat = 400
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                if geometry.frame(in: .global).minY <= 0 {
                    self.image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(y: geometry.frame(in: .global).minY/7)
                        .clipped()
                } else {
                    self.image
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
        ParallaxHeaderView(image: Image("omer"))
    }
}
