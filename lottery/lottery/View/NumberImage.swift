//
//  NumberImage.swift
//  lottery
//
//  Created by your3i on 2022/09/23.
//

import Foundation
import SwiftUI

struct NumberImage: View {

    var number: Int

    var filled: Bool = false

    var body: some View {
        let iconName = filled ? "\(number).circle.fill" : "\(number).circle"
        return Image(systemName: iconName)
    }
}
