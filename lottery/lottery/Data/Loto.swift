//
//  Loto.swift
//  lottery
//
//  Created by your3i on 2022/09/18.
//

import Foundation

struct Loto: Decodable {
    var round: String
    var date: Date
    var numbers: [Int]
    var bonus: [Int]
}
