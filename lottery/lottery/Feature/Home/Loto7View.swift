//
//  Loto7View.swift
//  lottery
//
//  Created by your3i on 2022/09/18.
//

import SwiftUI
import Combine

struct Loto7View: View {

    @State private var fromDate: Date = .now

    @State private var toDate: Date = .now

    @State private var selected: Set<Int> = []

    @State private var cancellable: AnyCancellable?

    private var result: [TableRowData] = [
        TableRowData(number: "1", frequency: "2", percentage: "20%", lastAppeared: "2022/8/1"),
        TableRowData(number: "2", frequency: "2", percentage: "20%", lastAppeared: "2022/8/1"),
        TableRowData(number: "3", frequency: "2", percentage: "20%", lastAppeared: "2022/8/1"),
        TableRowData(number: "4", frequency: "2", percentage: "20%", lastAppeared: "2022/8/1")
    ]

    var body: some View {
        VStack {
            HStack {
                DatePicker("", selection: $fromDate, displayedComponents: [.date])
                    .datePickerStyle(.compact)
                    .labelsHidden()
                Text("-")
                DatePicker("", selection: $toDate, displayedComponents: [.date])
                    .datePickerStyle(.compact)
                    .labelsHidden()
            }
            ScrollView(.horizontal) {
                HStack {
                    ForEach(1..<38) { num in
                        Button {
                            if selected.contains(num) {
                                selected.remove(num)
                            } else {
                                selected.insert(num)
                            }
                        } label: {
                            let iconName = selected.contains(num) ? "\(num).circle.fill" : "\(num).circle"
                            Image(systemName: iconName)
                                .font(.system(size: 36))
                        }
                    }
                }
                .padding()
            }
            Button {
                if selected.count == 37 {
                    selected.removeAll()
                } else {
                    for i in 1...37 {
                        selected.insert(i)
                    }
                }
            } label: {
                if selected.count == 37 {
                    Text("全部選択しない")
                } else {
                    Text("全部選択")
                }
            }

            Spacer()

            Table(result) {
                TableColumn("数字", value: \.number)
                TableColumn("出現回数", value: \.frequency)
                TableColumn("出現率", value: \.percentage)
                TableColumn("前回出現日", value: \.lastAppeared)
            }
        }
        .padding()
        .task {
            cancellable = FetchDataService.shared.fetch().sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { result in
                print(result)
            }
        }
    }
}

struct Loto7View_Previews: PreviewProvider {
    static var previews: some View {
        Loto7View()
    }
}
