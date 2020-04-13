//
//  Date+StringFormatter.swift
//  Cinephile
//
//  Created by omer ozkul on 13/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import Foundation

extension Date
{
    func toString(dateFormat format  : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}
