//
//  Date+Extension.swift
//  lottery
//
//  Created by your3i on 2022/09/23.
//

import Foundation

extension Date {

    static func date(from string: String, format: String = "yyyy/MM/dd") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: string)
    }

    func formatDayWithWeekday() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd (EE)"
        return formatter.string(from: self)
    }
}
