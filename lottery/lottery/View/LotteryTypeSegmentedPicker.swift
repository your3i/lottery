//
//  LotteryTypeSegmentedPicker.swift
//  lottery
//
//  Created by your3i on 2022/09/18.
//

import SwiftUI

struct LotteryTypeSegmentedPicker: View {

    @Binding var selected: LotteryType
    
    var body: some View {
        Picker("title", selection: $selected) {
            Text("LOTO7").tag(LotteryType.loto7)
            Text("LOTO6").tag(LotteryType.loto6)
        }
        .pickerStyle(.segmented)
    }
}

struct LotteryTypeSegmentedPicker_Previews: PreviewProvider {

    static var previews: some View {
        LotteryTypeSegmentedPicker(selected: .constant(.loto7))
    }
}
