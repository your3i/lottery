//
//  LotoStore.swift
//  lottery
//
//  Created by your3i on 2022/09/23.
//

import Foundation
import SwiftUI
import Combine

class LotoStore: ObservableObject {
    @Published var loto7: [Loto] = []
}
