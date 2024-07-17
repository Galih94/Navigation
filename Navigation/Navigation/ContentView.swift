//
//  ContentView.swift
//  Navigation
//
//  Created by Galih Samudra on 16/07/24.
//

import SwiftUI

struct Student: Hashable {
    let id: UUID = UUID()
    let name: String
    let number: Int
}

struct DetailView: View {
    var number: Int
    
    var body: some View {
        NavigationLink("Go to random number 1 - 1000", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
    }
}

struct ContentView: View {
    @State private var path = [Int]()
    var body: some View {
        NavigationStack(path: $path) {
            DetailView(number: 0)
                .navigationDestination(for: Int.self) { pathInt in
                    DetailView(number: pathInt)
                }
        }
    }
}

#Preview {
    ContentView()
}
