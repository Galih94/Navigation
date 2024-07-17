//
//  ContentView.swift
//  Navigation
//
//  Created by Galih Samudra on 16/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                Text("Hello world \(i)")
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("leading") {}
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("trailing") {}
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
