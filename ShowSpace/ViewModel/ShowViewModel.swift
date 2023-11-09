//
//  ContentViewModel.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 10/25/23.
//

import Foundation
import SwiftUI

class ShowViewModel: ObservableObject {
    
    @Published var shows = [Show]()
    
    
    @MainActor
    func getShows() async -> () {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        do {
            let url = URL(string: "https://api.tvmaze.com/shows")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(formatter)
            shows = try decoder.decode([Show].self, from: data)
        } catch {
            print(error)
        }
    }
}
