//
//  HomeView.swift
//  lottery
//
//  Created by your3i on 2022/09/18.
//

import SwiftUI

struct HomeView: View {

    enum LotteryType: String, CaseIterable, Identifiable {
        case loto7
        case loto6

        var id: Self { self }
    }

    @State private var selectedType: LotteryType = .loto7

    var body: some View {

        NavigationStack {
            VStack {
                Picker("title", selection: $selectedType) {
                    Text("LOTO7").tag(LotteryType.loto7)
                    Text("LOTO6").tag(LotteryType.loto6)
                }
                .pickerStyle(.segmented)
                .padding()
                if selectedType == .loto7 {
                    Loto7View()
                } else if selectedType == .loto6 {
                    Loto6View()
                }
                Spacer()
            }
        }
        .task {
            print("1233343")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
