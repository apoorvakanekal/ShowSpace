//
//  ContentView.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 10/25/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var contentViewModel = ContentViewModel()
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
