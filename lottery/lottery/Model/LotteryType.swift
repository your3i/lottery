//
//  LotteryType.swift
//  lottery
//
//  Created by your3i on 2022/09/18.
//

import Foundation

enum LotteryType: String, CaseIterable, Identifiable {
    case loto7 = "LOTO7"
    case loto6 = "LOTO6"

    var id: Self { self }
}
