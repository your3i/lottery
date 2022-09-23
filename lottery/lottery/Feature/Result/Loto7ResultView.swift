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
            LotoResultRowView(round: item.round, date: item.date, numbers: item.numbers, bonus: item.bonus)
        }
        .listStyle(.plain)
    }
}

struct Loto7ResultView_Previews: PreviewProvider {
    static var previews: some View {
        Loto7ResultView()
            .environmentObject(LotoStore.sample)
    }
}
