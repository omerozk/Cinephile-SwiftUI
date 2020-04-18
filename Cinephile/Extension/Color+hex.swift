//
//  Color+hex.swift
//  Cinephile
//
//  Created by omer ozkul on 16/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    init(_ hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }

    /// Custom colors
    public static let appLightWhite: Color = Color("appLightWhite")
    public static let appBlack: Color = Color("appBlack")
    public static let appGrey: Color = Color("appGrey")
    public static let appLightGrey: Color = Color("appLightGrey")
    public static let appRed: Color = Color("appRed")
    public static let appPaleBlue: Color = Color("appPaleBlue")
}
