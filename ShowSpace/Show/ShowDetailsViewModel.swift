//
//  ShowDetailsViewModel.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 11/14/23.
//

import Foundation
import SwiftUI

class ShowDetailsViewModel: ObservableObject {
    
    @Published var userRating: UserRating {
            didSet {
                saveRatingToDefaults()
            }
        }
    
    enum ShowStateType {
        case allShows
        case allStars
        case currentlyWatching
    }
    
    let show: Show
    var showStateType: ShowStateType = .allShows
    
    init(show: Show) {
        self.show = show
        
        if let savedRatingData = UserDefaults.standard.data(forKey: "\(show.id)_userRating"),
                   let savedRating = try? JSONDecoder().decode(UserRating.self, from: savedRatingData) {
                    self.userRating = savedRating
                } else {
                    // If there's no saved data, create a new UserRating instance
                    self.userRating = UserRating(rating: 0.0)
                }

//                self.viewModel = ShowDetailsViewModel(show: show)
//                viewModel.loadFromDefaults()
    }
    
    var showState = ShowState(id: -1, isAddedToList: false, isAddedToAllStars: false, isCurrentlyWatching: false)
    @Published var allShowsTitle = ""
    @Published var allShowsImage = ""
    @Published var allStarsTitle = ""
    @Published var allStarsImage = ""
    @Published var currentlyWatchingTitle = ""
    @Published var currentlyWatchingImage = ""

    
    func updateButtonInterface() {
        allShowsTitle = showState.isAddedToList ? "Added to list" : "Add to list?"
        allShowsImage = showState.isAddedToList  ? "checkmark" : "plus"
        allStarsTitle = showState.isAddedToAllStars ? "Added to all stars" : "Add to all stars?"
        allStarsImage = showState.isAddedToAllStars  ? "checkmark" : "plus"
        currentlyWatchingTitle = showState.isCurrentlyWatching ? "Watching show currently" : "Currently watching show?"
        currentlyWatchingImage = showState.isCurrentlyWatching ? "checkmark" : "plus"
    }
    
    
    func saveToDefaults(showStateType: ShowStateType) {
        
        
        let jsonDecoder = JSONDecoder()
        let jsonEncoder = JSONEncoder()

        
        if let data = UserDefaults.standard.object(forKey: "showState") as? Data,
           var showStates = try? jsonDecoder.decode([ShowState].self, from: data) {
           
            print(showStates)
            if let indexShow = showStates.firstIndex(where: { $0.id == show.id }) {
                
                var showToUpdate = showStates[indexShow]

                switch showStateType {
                case .allShows:
                    showToUpdate.isAddedToList = !showToUpdate.isAddedToList
                case .allStars:
                    showToUpdate.isAddedToAllStars = !showToUpdate.isAddedToAllStars
                case .currentlyWatching:
                    showToUpdate.isCurrentlyWatching = !showToUpdate.isCurrentlyWatching
                }
                
                showStates.remove(at: indexShow)
                showStates.insert(showToUpdate, at: indexShow)
            
            } else {
                
                let newShowState = ShowState(id: show.id, isAddedToList: showStateType == .allShows, isAddedToAllStars: showStateType == .allStars, isCurrentlyWatching: showStateType == .currentlyWatching)
                showStates.append(newShowState)
                
            }
            
            if let encodedData =  try? jsonEncoder.encode(showStates) {
                UserDefaults.standard.setValue(encodedData, forKey: "showState")
            } else {
                print("Fail to save data to defaults or not data saved")
            }
            
        } else {
            let newShowState = ShowState(id: show.id, isAddedToList: showStateType == .allShows, isAddedToAllStars: showStateType == .allStars, isCurrentlyWatching: showStateType == .currentlyWatching)
            
            if let encodedData =  try? jsonEncoder.encode([newShowState]) {
                UserDefaults.standard.setValue(encodedData, forKey: "showState")
            } else {
                print("Fail to save data to defaults")
            }
        }
        
        switch showStateType {
        case .allShows:
            showState.isAddedToList = !showState.isAddedToList
        case .allStars:
            showState.isAddedToAllStars = !showState.isAddedToAllStars
        case .currentlyWatching:
            showState.isCurrentlyWatching = !showState.isCurrentlyWatching
        }
        updateButtonInterface()
    }
    
    func loadFromDefaults() {
        let jsonDecoder = JSONDecoder()
        if let data = UserDefaults.standard.object(forKey: "showState") as? Data,
           let showStates = try? jsonDecoder.decode([ShowState].self, from: data),
           let show = showStates.filter({ $0.id == show.id }).first {
            
            showState.isAddedToList = show.isAddedToList
            showState.isAddedToAllStars = show.isAddedToAllStars
            showState.isCurrentlyWatching = show.isCurrentlyWatching
        } else {
            print("Fail to read data from defaults")
        }
        
        updateButtonInterface()
    }
    
    private func saveRatingToDefaults() {
           if let encodedData = try? JSONEncoder().encode(userRating) {
               UserDefaults.standard.set(encodedData, forKey: "\(show.id)_userRating")
           }
       }
    
    func updateRating(_ rating: Double) {
            userRating.rating = rating
        }
}
