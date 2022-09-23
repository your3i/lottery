//
//  lotteryApp.swift
//  lottery
//
//  Created by your3i on 2022/09/18.
//

import SwiftUI
import Combine

@main
struct lotteryApp: App {

    @StateObject private var store = LotoStore()

    @State private var cancellable: AnyCancellable?

    var body: some Scene {
        WindowGroup {
            RootTabView()
                .task {
                    cancellable = FetchDataService.shared.fetch()
                        .receive(on: RunLoop.main)
                        .sink { completion in
                            switch completion {
                            case .finished:
                                break
                            case .failure(let error):
                                print(error.errorDescription)
                            }
                        } receiveValue: { result in
                            store.loto7 = result
                        }
                }
                .environmentObject(store)
        }
    }
}

//private struct StoreKey: EnvironmentKey {
//    static let defaultValue: LotoStore? = nil
//}
//
//extension EnvironmentValues {
//    var lotoStore: LotoStore? {
//        get { self[StoreKey.self] }
//        set { self[StoreKey.self] = newValue}
//    }
//}
//
//extension View {
//    func lotoStore(_ value: LotoStore) -> some View {
//        environment(\.lotoStore, value)
//    }
//}
