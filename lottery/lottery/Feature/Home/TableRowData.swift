//
//  TableRowData.swift
//  lottery
//
//  Created by your3i on 2022/09/18.
//

import Foundation

struct TableRowData: Identifiable {
    var number: String
    var frequency: String
    var percentage: String
    var lastAppeared: String
    let id = UUID()
}
