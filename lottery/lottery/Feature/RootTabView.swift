//
//  RootTabView.swift
//  lottery
//
//  Created by your3i on 2022/09/18.
//

import SwiftUI
import Combine

struct RootTabView: View {

    @StateObject private var store = LotoStore()

    @State private var cancellable: AnyCancellable?
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("数字の出現", systemImage: "percent")
                }
            ResultView()
                .tabItem {
                    Label("抽選結果", systemImage: "clock")
                }
            AboutView()
                .tabItem {
                    Label("このアプリ", systemImage: "info.circle")
                }
        }
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

struct RootTabView_Previews: PreviewProvider {

    static let data = LotoStore()

    static var previews: some View {
        RootTabView()
            .environmentObject(data)
    }
}
