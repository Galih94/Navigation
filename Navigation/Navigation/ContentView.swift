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
    var body: some View {
        
        NavigationStack() {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("select number \(i)", value: i)
                }
                
                ForEach(0..<5) { i in
                    NavigationLink("select string \(i)", value: "\(i)")
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("Selected number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("Selected string \(selection)")
            }
        }
    }
}

#Preview {
    ContentView()
}
