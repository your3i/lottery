//
//  ResultView.swift
//  lottery
//
//  Created by your3i on 2022/09/18.
//

import SwiftUI

struct ResultView: View {

    @State private var selectedType: LotteryType = .loto7

    var body: some View {
        NavigationStack {
            VStack {
                LotteryTypeSegmentedPicker(selected: $selectedType)
                    .padding()
                if selectedType == .loto7 {
                    Loto7ResultView()
                } else if selectedType == .loto6 {
                    Loto6View()
                }
                Spacer()
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
            .environmentObject(LotoStore.sample)
    }
}
