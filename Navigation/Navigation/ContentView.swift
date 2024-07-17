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
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            Text("Hello")
            .toolbar {
                Button("push number 1") {
                    path.append(1)
                }
                Button("push string hello") {
                    path.append("hello")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
