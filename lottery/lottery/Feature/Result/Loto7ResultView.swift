//
//  Loto7ResultView.swift
//  lottery
//
//  Created by your3i on 2022/09/18.
//

import SwiftUI

struct Loto7ResultView: View {

    @State private var data: [Loto7ResultTableRowData] = [
        Loto7ResultTableRowData(round: "1", date: "1991/1/1", numbers: "1, 2, 3", bonus: "1, 2"),
        Loto7ResultTableRowData(round: "2", date: "1991/1/1", numbers: "1, 2, 3", bonus: "1, 2"),
        Loto7ResultTableRowData(round: "3", date: "1991/1/1", numbers: "1, 2, 3", bonus: "1, 2")
    ]

    var body: some View {
        ForEach(data) { datum in
            HStack {
                /*@START_MENU_TOKEN@*/Text(datum.round)/*@END_MENU_TOKEN@*/
                Text(datum.date)
                Text(datum.numbers)
                Text(datum.bonus)
            }
        }
    }
}

struct Loto7ResultView_Previews: PreviewProvider {
    static var previews: some View {
        Loto7ResultView()
    }
}
