//
//  Loto7ResultView.swift
//  lottery
//
//  Created by your3i on 2022/09/18.
//

import SwiftUI

struct Loto7ResultView: View {

    @EnvironmentObject var store: LotoStore

    var body: some View {
        List(store.loto7[..<7]) { item in
            ResultRowView(round: item.round, date: item.date, numbers: item.numbers, bonus: item.bonus)
        }
        .listStyle(.plain)
    }
}
