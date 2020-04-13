//
//  DateFormatter+iso8601Full.swift
//  Cinephile
//
//  Created by omer ozkul on 13/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import Foundation

extension DateFormatter {
    /// decoder.dateDecodingStrategy = .iso8601
    /// Unfortunately it still does not work as it seems the Foundation library does not support iso8601 times that include fractional seconds (02:55.000)
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}
