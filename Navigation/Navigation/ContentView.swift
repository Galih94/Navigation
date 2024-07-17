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
    var student: Student
    
    var body: some View {
        VStack {
            Text(student.name)
            Text("\(student.number)")
        }
        
    }
    
    init(student: Student) {
        self.student = student
        print("creating detail view: \(student)")
    }
}

struct ContentView: View {
    @State private var path = [Int]()
    var body: some View {
        
        NavigationStack(path: $path) {
            VStack {
                Button("show 32") {
                    path = [32]
                }
                
                Button("show 64") {
                    path.append(64)
                }
                
                Button("show 32 then 64") {
                    path = [32, 64]
                }
                
                Button("show 2 then 10") {
                    path = [2, 10]
                }
                
                Button("show 72") {
                    path.append(72)
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("Selected \(selection)")
                Button("show 100") {
                    path.append(100)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
