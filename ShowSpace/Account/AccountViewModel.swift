//
//  AccountViewModel.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 11/15/23.
//

import Foundation
import Combine
import UIKit
import Helpers

class AccountViewModel: ObservableObject {
    

    var newUpdatedName = ""
    let userProfileViewModel = UserProfileViewModel()
    var profileData: Data?
    @Published var userName: String = ""
    
    private var cancellables = Set<AnyCancellable>()

    init() {
        registerObservables()
        loadInitialValues()
    }
    
    func getNewName() -> String {
       return  NamesManager.shared.updatedName
    }
    
    func registerObservables() {

        userProfileViewModel.userProfileDetails
            .sink { [weak self] userDetails in
                self?.profileData = userDetails.profileImage
                self?.userName = userDetails.userName
            }
            .store(in: &cancellables)
    }
    
    func loadInitialValues() {
        //Get image from file system
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = documents.appendingPathComponent("profileImage.png")

        do {
            let data = try Data(contentsOf: url)
            profileData = data
        } catch {
            print("Unable to Write Data to Disk (\(error))")
        }
        
        //Get user name from defaults
        let userDefaults = UserDefaults.standard
        if let savedName = userDefaults.object(forKey: "userName") as? String {
            userName = savedName
        }
    }
    
    func setDataForSettingsView() {
        userProfileViewModel.updateInterfaceFromSavedData(userName: userName, imageData: profileData)
    }
    
}
