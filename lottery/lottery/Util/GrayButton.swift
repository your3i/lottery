//
//  GrayButton.swift
//  lottery
//
//  Created by your3i on 2022/09/26.
//

import Foundation
import SwiftUI

struct GrayButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(AppColor.surface)
            .foregroundColor(AppColor.blue)
            .clipShape(Capsule())
    }
}
