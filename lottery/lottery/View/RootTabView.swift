//
//  RootTabView.swift
//  lottery
//
//  Created by your3i on 2022/09/18.
//

import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("出現率", systemImage: "percent")
                }
            AboutView()
                .tabItem {
                    Label("このアプリ", systemImage: "info.circle")
                }
        }
    }
}

struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView()
    }
}
