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

@Observable
class PathStore {
    var path: [Int] {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode([Int].self, from: data) {
                path = decoded
                return
            }
        }
        self.path = []
    }
    
    func save() {
        let representation = path
        do {
            let encoded = try JSONEncoder().encode(representation)
            try encoded.write(to: savePath)
            
        } catch {
            print("failed load data - \(error)")
        }
    }
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
    @State private var pathStore = PathStore()
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailView(path: $pathStore.path, number: 0)
                .navigationDestination(for: Int.self) { pathInt in
                    DetailView(path: $pathStore.path, number: pathInt)
                }
        }
    }
}

#Preview {
    ContentView()
}
