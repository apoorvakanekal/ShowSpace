//
//  UserViewModel.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 11/15/23.
//


import Foundation
import Combine

enum ImageState {
    case none
    case loaded
    case error
}

class UserProfileViewModel: ObservableObject {
    
    @Published var imageState: ImageState = .none {
        didSet {
            showAlert = imageState == .error
        }
    }
    @Published var showAlert = false
    // Data coming from user selection
    var imageData: Data?
    var userProfileDetails = CurrentValueSubject<UserProfile, Never>(UserProfile(userName: "", profileImage: nil))

    var imageTtile: String {
        if imageState == .loaded {
            return "Change Profile Image"
        } else {
            return "Select Profile Image"
        }
    }
    
    // Data coming from Home View that is persistent through launches
    var savedUserName: String?
    var savedUserImageData: Data?
    
    func saveUserProfile(userName: String) {
        
        var currentUserData: Data? = imageData
        if currentUserData == nil {
            currentUserData = savedUserImageData
        }
        
        let userDetails = UserProfile(userName: userName, profileImage: currentUserData)
        userProfileDetails.send(userDetails)
        storeImage()
        saveUserName(userName: userName)
    }

    func storeImage() {
        guard let data = imageData else { return }
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = documents.appendingPathComponent("profileImage.png")

        do {
            try data.write(to: url)
        } catch {
            print("Unable to Write Data to Disk (\(error))")
        }
    }
    
    func saveUserName(userName: String) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(userName, forKey: "userName")
    }
    
    func updateInterfaceFromSavedData(userName: String, imageData: Data?) {
        if !userName.isEmpty {
            savedUserName = userName
        }
        if imageData != nil {
            savedUserImageData = imageData
        }
    }
    
}
