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
                .toolbarBackground(DesignConstants.bgColor, for: .tabBar)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .environment(\.colorScheme, .dark)
            SearchView()
                .toolbarBackground(DesignConstants.bgColor, for: .tabBar)
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .environment(\.colorScheme, .dark)
            AccountView()
                .toolbarBackground(DesignConstants.bgColor, for: .tabBar)
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

