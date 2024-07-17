//
//  ContentView.swift
//  Navigation
//
//  Created by Galih Samudra on 16/07/24.
//

import SwiftUI

struct ContentView: View {
    let stateHide = false
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                Text("Hello world \(i)")
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("1") {}
                    Button("2") {}
                }
                
            }
            .navigationBarBackButtonHidden(stateHide)
        }
        
    }
}

#Preview {
    ContentView()
}
