//
//  EditProfileView.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 11/15/23.
//

import SwiftUI
import PhotosUI
import UIComponents

struct EditProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var userProfileViewModel: UserProfileViewModel
    @State var userName: String = ""
    @State private var imageItem: PhotosPickerItem?
    @State private var photoGalleryImage: Image?
    
    var body: some View {
        ZStack{
            DesignConstants.bgColor
                .ignoresSafeArea()
            DefaultNavigationView(title: "Settings") {
                VStack {
                    Spacer()
                    HStack {
                        Text("Name: ")
                            .foregroundColor(DesignConstants.textColor)
                            .font(.headline)
                        Spacer()
                    }
                    
                    TextField("Enter Name", text: $userName)
                        .background(Color(DesignConstants.textColor))
                        .padding(.bottom, 24)
                    
                    if let photoGalleryImage, userProfileViewModel.imageState == .loaded {
                        photoGalleryImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350, height: 350)
                        
                    } else {
                        Image("defaultPerson")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350, height: 350)
                    }
                    
                    PhotosPicker(userProfileViewModel.imageTtile, selection: $imageItem, matching: .images)
                    
                    Spacer()
                    
                    Button {
                        userProfileViewModel.saveUserProfile(userName: userName)
                        dismiss()
                    } label: {
                        Text("Save")
                            .fontWeight(.bold)
                            .foregroundColor(Color("cool purple"))
                            .frame(height: 58)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color(DesignConstants.textColor))
                            .cornerRadius(5)
                    }
                    .padding(.vertical, 16)
                    .disabled(userName.isEmpty)
                    
                }
                .padding(.horizontal, 16)
                .alert(isPresented: $userProfileViewModel.showAlert, content: {
                    Alert(title: Text("Something went wrong"),
                          message: Text("We couldn't load the image"),
                          dismissButton: .default(Text("Ok")))
                })
                .onChange(of: imageItem) { _ in
                    Task {
                        guard let data = try? await imageItem?.loadTransferable(type: Data.self),
                              let uiImage = UIImage(data: data)
                        else {
                            userProfileViewModel.imageState =  .error
                            return
                        }
                        userProfileViewModel.imageData = data
                        photoGalleryImage = Image(uiImage: uiImage)
                        userProfileViewModel.imageState = .loaded
                    }
                }
                .onAppear {
                    if let savedUserName = userProfileViewModel.savedUserName {
                        userName = savedUserName
                    }
                    if let savedImageData = userProfileViewModel.savedUserImageData,
                       let uiImage = UIImage(data: savedImageData) {
                        photoGalleryImage = Image(uiImage: uiImage)
                        userProfileViewModel.imageState = .loaded
                    }
                }
            }
        }
    }
}

#Preview {
    EditProfileView(userProfileViewModel: UserProfileViewModel())
}
