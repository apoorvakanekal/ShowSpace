//
//  ContentViewModel.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 10/25/23.
//

import Foundation

class ShowViewModel: ObservableObject {
    
    @Published var shows = [Show]()
    
    @MainActor
    func getShows() async -> () {
        do {
            let url = URL(string: "https://api.tvmaze.com/shows")!
            let (data, _) = try await URLSession.shared.data(from: url)
            shows = try JSONDecoder().decode([Show].self, from: data)
        } catch {
            print(error)
        }
    }
}
