//
//  ContentView.swift
//  Navigation
//
//  Created by Galih Samudra on 16/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var title = "SwiftUI"
    var body: some View {
        NavigationStack {
            Text("Hello world")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
