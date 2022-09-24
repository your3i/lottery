//
//  HomeView.swift
//  lottery
//
//  Created by your3i on 2022/09/18.
//

import SwiftUI

struct HomeView: View {

    @State private var selectedType: LotteryType = .loto7

    var body: some View {
        NavigationStack {
            VStack {
                LotteryTypeSegmentedPicker(selected: $selectedType)
                    .padding()
                if selectedType == .loto7 {
                    Loto7View()
                } else if selectedType == .loto6 {
                    Loto6View()
                }
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(LotoStore.sample)
    }
}
