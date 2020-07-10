//
//  Date+Extentions.swift
//  HeadyAssignment
//
//  Created by Heramb Joshi on 10/07/20.
//  Copyright © 2020 Heramb Joshi. All rights reserved.
//

import Foundation

extension Date {
    
  static var productDateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }
}
