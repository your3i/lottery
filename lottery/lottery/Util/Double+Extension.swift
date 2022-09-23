//
//  Double+Extension.swift
//  lottery
//
//  Created by your3i on 2022/09/23.
//

import Foundation

extension Double {

    func toPercent() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
