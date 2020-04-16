//
//  VBarChartView.swift
//  Cinephile
//
//  Created by omer ozkul on 16/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import SwiftUI

struct VBarChartView: View {
    var title: String
    var items: [(key: String, value: Int)]
    var maxValue: Int
    
    func scaledHeight(val: Int, max: Int) -> CGFloat {
        let scaledVal = (CGFloat(val) / CGFloat(max)) * 20
        return scaledVal * 9.0
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Text(self.title)
                .font(.headline)
                .frame(height: 20)
                .padding(.top, 8)
            Divider().padding(.horizontal, 20)
            HStack {
                ForEach(0..<self.items.count) { i in
                    VStack {
                        Spacer()
                        Text("\(String(self.items[i].value))")
                            .font(.footnote)
                            .rotationEffect(.degrees(-90))
                            .zIndex(1)

                        Rectangle()
                            .fill(i < 3 ? Color.appRed : (i < 7 ? Color.yellow : Color.green))
                            .frame(width: 20,
                                   height: self.scaledHeight(val: self.items[i].value, max: self.maxValue))
                        Text(Array(self.items)[i].key)
                            .font(.footnote)
                            .frame(height: 20)
                    }
                }
            }
        }
    }
}

struct VBarChartView_Previews: PreviewProvider {
    static var previews: some View {
        VBarChartView(title: "Movie and series ratings",
                      items: [("1", 12), ("2", 9), ("3", 60), ("4", 2), ("5", 4),
                              ("6", 3), ("7", 29), ("8", 19), ("9", 2), ("10", 0)],
                      maxValue: 60)
        .previewLayout(PreviewLayout.fixed(width: 320, height: 300))
    }
}

