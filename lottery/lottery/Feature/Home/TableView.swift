//
//  TableView.swift
//  lottery
//
//  Created by your3i on 2022/09/23.
//

import SwiftUI

struct TableView: View {

    var queryResult: [QueryResult] = []

    private var allCountString: String {
        return "記録数：\(queryResult.count)"
    }

    var body: some View {
        GeometryReader { proxy in
            VStack {
                HStack {
                    Text(allCountString)
                        .font(.caption)
                        .foregroundColor(.gray.opacity(0.8))
                    Spacer()
                }
                .padding(.horizontal, 8)
                HStack(spacing: 0) {
                    Group {
                        Text("数字")
                            .frame(width: proxy.size.width * 0.20)
                        Text("出現回数")
                            .frame(width: proxy.size.width * 0.20)
                        Text("出現率")
                            .frame(width: proxy.size.width * 0.30)
                        Text("最後の\n出現日")
                            .frame(width: proxy.size.width * 0.30)
                    }
                    .font(.system(size: 14, weight: .bold))
                }
                .frame(height: 44)
                .background(Color.gray.opacity(0.3))
                List(queryResult) { row in
                    HStack(spacing: 0) {
                        Group {
                            NumberImage(number: row.number)
                                .frame(width: proxy.size.width * 0.20)
                                .font(.system(size: 26))
                            Text(String(row.frequency))
                                .frame(width: proxy.size.width * 0.20)
                            Text(String(row.frequencyPercent))
                                .frame(width: proxy.size.width * 0.30)
                            Text(row.lastDateAppeared)
                                .frame(width: proxy.size.width * 0.30)
                        }
                        .font(.system(size: 16))
                    }
                }
                .listStyle(.plain)
            }
            .padding(.zero)
        }
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView(queryResult: [
            QueryResult(number: 1, frequency: 20, frequencyPercent: "0.3%", lastDateAppeared: "1991/1/23"),
            QueryResult(number: 1, frequency: 20, frequencyPercent: "0.3%", lastDateAppeared: "1991/1/23"),
            QueryResult(number: 1, frequency: 20, frequencyPercent: "0.3%", lastDateAppeared: "1991/1/23"),
        ])
    }
}
