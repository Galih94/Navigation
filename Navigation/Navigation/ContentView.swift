//
//  ContentView.swift
//  Navigation
//
//  Created by Galih Samudra on 16/07/24.
//

import SwiftUI

struct DetailView: View {
    var number: Int
    
    var body: some View {
        Text("Detail view: \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("creating detail view: \(number)")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Tap me") {
                DetailView(number: 102)
            }
        }
    }
}

#Preview {
    ContentView()
}
