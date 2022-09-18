//
//  Loto7ResultView.swift
//  lottery
//
//  Created by your3i on 2022/09/18.
//

import SwiftUI

struct Loto7ResultView: View {

    private var data: [Loto7ResultTableRowData] = [
        Loto7ResultTableRowData(round: "1", date: "1991/1/1", numbers: "1, 2, 3", bonus: "1, 2"),
        Loto7ResultTableRowData(round: "1", date: "1991/1/1", numbers: "1, 2, 3", bonus: "1, 2"),
        Loto7ResultTableRowData(round: "1", date: "1991/1/1", numbers: "1, 2, 3", bonus: "1, 2")
    ]

    var body: some View {
        Table(data) {
            TableColumn("回別", value: \.round).width(ideal: 20)
            TableColumn("抽選日", value: \.date).width(ideal: 20)
            TableColumn("当選番号", value: \.numbers).width(ideal: 20)
            TableColumn("ボーナス番号", value: \.bonus).width(ideal: 20)
        }
    }
}

struct Loto7ResultView_Previews: PreviewProvider {
    static var previews: some View {
        Loto7ResultView()
    }
}
