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
    @Binding var path: [Int]
    var number: Int
    
    var body: some View {
        NavigationLink("Go to random number 1 - 1000", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    path.removeAll()
                }
            }
    }
}

struct ContentView: View {
    @State private var path = [Int]()
    var body: some View {
        NavigationStack(path: $path) {
            DetailView(path: $path, number: 0)
                .navigationDestination(for: Int.self) { pathInt in
                    DetailView(path: $path, number: pathInt)
                }
        }
    }
}

#Preview {
    ContentView()
}
