//
//  AboutView.swift
//  lottery
//
//  Created by your3i on 2022/09/18.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationTitle(Text("このアプリについて"))
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
