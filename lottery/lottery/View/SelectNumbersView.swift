//
//  SelectNumbersView.swift
//  lottery
//
//  Created by your3i on 2022/09/24.
//

import SwiftUI

struct SelectNumbersView: View {

    @Binding var selecting: Set<Int>

    var min = 1

    var max = 37

    var rowSize = 6

    private var rowCount: Int {
        max / rowSize + (max % rowSize == 0 ? 0 : 1)
    }

    private func toggleSelectAll() {
        if isSelectingAll() {
            selecting.removeAll()
        } else {
            for i in min...max {
                selecting.insert(i)
            }
        }
    }

    private func isSelectingAll() -> Bool {
        selecting.count == max - min + 1
    }

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 16)
                HStack {
                    Spacer()
                    Button {
                        toggleSelectAll()
                    } label: {
                        if isSelectingAll() {
                            Text("全部選択しない")
                                .font(.system(size: 14))
                        } else {
                            Text("全部選択")
                                .font(.system(size: 14))
                        }
                    }
                    .buttonStyle(GrayButton())
                }
                .padding(.bottom, 8)
                Grid {
                    ForEach(0..<rowCount, id: \.self) { row in
                        GridRow {
                            ForEach(0..<rowSize, id: \.self) { col in
                                let n = row * rowSize + col + 1
                                if n <= max {
                                    NumberImage(number: n, filled: selecting.contains(n))
                                        .font(.system(size: 30))
                                        .foregroundColor(selecting.contains(n) ? AppColor.red : AppColor.blue)
                                        .padding(.all, 4)
                                        .onTapGesture {
                                            if selecting.contains(n) {
                                                selecting.remove(n)
                                            } else {
                                                selecting.insert(n)
                                            }
                                        }
                                }
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .navigationBarTitle(Text("検索する数字を選択"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SelectNumbersView_Previews: PreviewProvider {
    static var previews: some View {
        SelectNumbersView(selecting: .constant([1, 2, 3]))
    }
}



