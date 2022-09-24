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

    @State private var selecting: Set<Int> = []

    @State private var popoverIsPresented: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("期間")
                    .font(.system(size: 16, weight: .bold))
                HStack {
                    DatePicker("", selection: $fromDate, displayedComponents: [.date])
                        .datePickerStyle(.compact)
                        .labelsHidden()
                    Text("-")
                    DatePicker("", selection: $toDate, displayedComponents: [.date])
                        .datePickerStyle(.compact)
                        .labelsHidden()
                }
            }

            Spacer().frame(height: 24)

            VStack(alignment: .leading) {
                Text("検索する数字")
                    .font(.system(size: 16, weight: .bold))
                Button {
                    popoverIsPresented.toggle()
                } label: {
                    if selecting.isEmpty {
                        Text("タップして選択")
                    } else {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(selecting.sorted(), id: \.self) { n in
                                    NumberImage(number: n)
                                        .font(.system(size: 20))
                                }
                            }
                        }
                        .scrollIndicators(.hidden)
                    }
                }
                .frame(height: 32)
                .popover(isPresented: $popoverIsPresented) {
                    SelectNumbersView(selecting: $selecting)
                        .presentationDetents([.medium])
                }
            }

            Spacer()
                .frame(height: 32)

            TableView(queryResult: QueryFrequencyService.shared.query(store.loto7, fromDate, toDate, selecting).sorted(by: {
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
