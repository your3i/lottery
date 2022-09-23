//
//  QueryFrequencyService.swift
//  lottery
//
//  Created by your3i on 2022/09/23.
//

import Foundation

struct QueryResult: Identifiable {
    var id = UUID()
    var number: Int
    var frequency: Int
    var frequencyPercent: String
    var lastDateAppeared: String
}

class QueryFrequencyService {

    static let shared = QueryFrequencyService()

    private init() { }

    func query(_ data: [Loto], _ dateFrom: Date, _ dateTo: Date, _ numbers: Set<Int>) -> [QueryResult] {
        var frequency: [Int: Int] = [:]
        var lastDate: [Int: Date] = [:]
        var result: [QueryResult] = []
        var allCount = 0

        for item in data {
            guard let date = Date.date(from: item.date), dateFrom...dateTo ~= date else {
                continue
            }
            allCount += 1
            let nums = Set<Int>(item.numbers)
            let exist = nums.intersection(numbers)
            for n in exist {
                frequency[n] = frequency[n, default: 0] + 1
                if let ldate = lastDate[n] {
                    lastDate[n] = max(ldate, date)
                } else {
                    lastDate[n] = date
                }
            }
        }

        for n in numbers {
            guard let freq = frequency[n], let date = lastDate[n] else {
                continue
            }
            result.append(QueryResult(
                number: n,
                frequency: freq,
                frequencyPercent: (Double(freq) / Double(allCount)).toPercent(),
                lastDateAppeared: date.formatDay())
            )
        }

        return result
    }
}
