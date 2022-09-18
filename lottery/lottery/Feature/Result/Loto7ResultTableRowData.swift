//
//  Loto7ResultTableRowData.swift
//  lottery
//
//  Created by your3i on 2022/09/18.
//

import Foundation

struct Loto7ResultTableRowData: Identifiable {
    var id = UUID()
    var round: String
    var date: String
    var numbers: String
    var bonus: String
}
