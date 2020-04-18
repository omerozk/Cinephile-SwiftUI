//
//  Text+Style.swift
//  Cinephile
//
//  Created by omer ozkul on 18/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import Foundation
import SwiftUI

struct CSmallStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("HelveticaNeue-light", size: 11))
            .foregroundColor(Color.appGrey)
    }
}

extension Text {
    func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}
