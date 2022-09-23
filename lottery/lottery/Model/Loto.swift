//
//  Loto.swift
//  lottery
//
//  Created by your3i on 2022/09/18.
//

import Foundation

struct Loto: Decodable, Identifiable {
    var id = UUID()

    var round: String
    var date: String
    var numbers: [Int]
    var bonus: [Int]

    init(round: String, date: String, numbers: [Int], bonus: [Int]) {
        self.round = round
        self.date = date
        self.numbers = numbers
        self.bonus = bonus
    }

    enum CodingKeys: String, CodingKey {
        case round
        case date
        case numbers
        case bonus
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        round = try values.decode(String.self, forKey: .round)
        date = try values.decode(String.self, forKey: .date)
        let numbersString = try values.decode(String.self, forKey: .numbers)
        numbers = numbersString.split(separator: ",").map { Int($0)! }
        let bonusString = try values.decode(String.self, forKey: .bonus)
        bonus = bonusString.split(separator: ",").map { Int($0)! }
    }
}

extension Loto {

    var numbersDisplay: String {
        numbers.map { String($0) }.joined(separator: ", ")
    }

    var bonusDisplay: String {
        bonus.map { String($0) }.joined(separator: ", ")
    }
}
