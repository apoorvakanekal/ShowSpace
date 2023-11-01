//
//  ContentView.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 10/25/23.
//


import SwiftUI
import Foundation


struct ContentView: View {
    
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

