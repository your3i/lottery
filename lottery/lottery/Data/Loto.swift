//
//  Loto.swift
//  lottery
//
//  Created by your3i on 2022/09/18.
//

import Foundation

struct Loto: Decodable {
    var round: String
    var date: Date?
    var numbers: [Int]
    var bonus: [Int]

    enum CodingKeys: String, CodingKey {
        case round
        case date
        case numbers
        case bonus
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        round = try values.decode(String.self, forKey: .round)
        let dateString = try values.decode(String.self, forKey: .date)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/m/d"
        date = formatter.date(from: dateString)
        let numbersString = try values.decode(String.self, forKey: .numbers)
        numbers = numbersString.split(separator: ",").map { Int($0)! }
        let bonusString = try values.decode(String.self, forKey: .bonus)
        bonus = bonusString.split(separator: ",").map { Int($0)! }
    }
}
