//
//  ResultRowView.swift
//  lottery
//
//  Created by your3i on 2022/09/23.
//

import SwiftUI

struct ResultRowView: View {

    var round: String

    var date: String

    var numbers: [Int]

    var bonus: [Int]

    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Group {
                    Text("第" + round + "回")
                    Text(Date.date(from: date)?.formatDayWithWeekday() ?? "")
                }
                .font(.system(size: 16).bold())
                Spacer()
            }
            .padding(.bottom, 8)
            HStack {
                ForEach(numbers, id: \.self) { num in
                    NumberImage(number: num)
                        .font(.system(size: 26))
                        .foregroundColor(AppColor.blue)
                }
                ForEach(bonus, id: \.self) { num in
                    NumberImage(number: num)
                        .font(.system(size: 26))
                        .foregroundColor(AppColor.red)
                }
                Spacer()
            }
        }
    }
}

struct ResultRowView_Previews: PreviewProvider {
    static var previews: some View {
        ResultRowView(round: "480", date: "2022/03/05", numbers: [1, 2, 3], bonus: [4, 5])
    }
}
