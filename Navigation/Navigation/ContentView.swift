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
    let students: [Student] = [
        Student(name: "Galih", number: 1),
        Student(name: "Samodra", number: 2),
        Student(name: "Wicaksono", number: 3)
    ]
    var body: some View {
        NavigationStack {
            ForEach(students, id: \.id) { student in
                NavigationLink("Select student \(student.name)", value: student)
            }
            .navigationDestination(for: Student.self) { selectonStudent in
                DetailView(student: selectonStudent)
            }
        }
    }
}

#Preview {
    ContentView()
}
