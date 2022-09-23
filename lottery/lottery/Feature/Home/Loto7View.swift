//
//  Loto7View.swift
//  lottery
//
//  Created by your3i on 2022/09/18.
//

import SwiftUI
import Combine

struct Loto7View: View {

    @EnvironmentObject var store: LotoStore

    @State private var fromDate: Date = Date.date(from: "2022/9/1")!

    @State private var toDate: Date = .now

    @State private var selected: Set<Int> = []

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
                .frame(height: 32)

            TableView(queryResult: QueryFrequencyService.shared.query(store.loto7, fromDate, toDate, selected).sorted(by: {
                $0.frequency > $1.frequency
            }))
        }
        .padding()
    }
}

struct Loto7View_Previews: PreviewProvider {
    static var previews: some View {
        Loto7View()
            .environmentObject(LotoStore.sample)
    }
}
