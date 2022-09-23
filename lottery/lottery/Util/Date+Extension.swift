//
//  Date+Extension.swift
//  lottery
//
//  Created by your3i on 2022/09/23.
//

import Foundation

extension Date {

    static func date(from string: String, format: String = "yyyy/M/d") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: string)
    }

    /// yyyy/M/d (EE)
    func formatDayWithWeekday() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/M/d (EE)"
        return formatter.string(from: self)
    }

    /// yyyy/M/d
    func formatDay() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/M/d"
        return formatter.string(from: self)
    }
}
