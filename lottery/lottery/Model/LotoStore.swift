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


extension LotoStore {

    static let sample = {
        let store = LotoStore()
        store.loto7 = [
            Loto(round: "488", date: "2022/9/16", numbers: [3,13,16,18,19,20,35], bonus: [2,11]),
            Loto(round: "487", date: "2022/9/16", numbers: [3,13,16,18,19,20,35], bonus: [2,11]),
            Loto(round: "486", date: "2022/9/16", numbers: [3,13,16,18,19,20,35], bonus: [2,11]),
            Loto(round: "485", date: "2022/9/16", numbers: [3,13,16,18,19,20,35], bonus: [2,11]),
            Loto(round: "485", date: "2022/9/16", numbers: [3,13,16,18,19,20,35], bonus: [2,11]),
            Loto(round: "485", date: "2022/9/16", numbers: [3,13,16,18,19,20,35], bonus: [2,11]),
            Loto(round: "485", date: "2022/9/16", numbers: [3,13,16,18,19,20,35], bonus: [2,11]),
            Loto(round: "485", date: "2022/9/16", numbers: [3,13,16,18,19,20,35], bonus: [2,11]),
        ]
        return store
    }()
}
