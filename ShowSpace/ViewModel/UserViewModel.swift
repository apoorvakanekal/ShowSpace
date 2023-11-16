//
//  UserViewModel.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 11/15/23.
//


//import SwiftUI
//import PhotosUI
////import UIComponents
//
//struct SettingsView: View {
//    
//    @Environment(\.dismiss) var dismiss
//    @ObservedObject var settingsViewModel: SettingsViewModel
//    @State var userName: String = ""
//    @State private var imageItem: PhotosPickerItem?
//    @State private var photoGalleryImage: Image?
//    
//    var body: some View {
//        DefaultNavigationView(title: "Settings") {
//            VStack {
//                Spacer()
//                HStack {
//                    Text("Name: ")
//                    Spacer()
//                }
//                
//                TextField("Enter Name", text: $userName)
//                    .padding(.bottom, 24)
//                
//                if let photoGalleryImage, settingsViewModel.imageState == .loaded {
//                    photoGalleryImage
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 350, height: 350)
//
//                } else {
//                    Image("defaultPerson")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 350, height: 350)
//                }
//                
//                PhotosPicker(settingsViewModel.imageTtile, selection: $imageItem, matching: .images)
//                
//                Spacer()
//                
//                Button {
//                    settingsViewModel.saveUserProfile(userName: userName)
//                    dismiss()
//                } label: {
//                    Text("Save")
//                }
//                .padding(.vertical, 16)
//                .disabled(userName.isEmpty)
//
//            }
//            .padding(.horizontal, 16)
//            .alert(isPresented: $settingsViewModel.showAlert, content: {
//                Alert(title: Text("Something went wrong"),
//                message: Text("We couldn't load the image"),
//                      dismissButton: .default(Text("Ok")))
//            })
//            .onChange(of: imageItem) { _ in
//                Task {
//                    guard let data = try? await imageItem?.loadTransferable(type: Data.self),
//                          let uiImage = UIImage(data: data)
//                    else {
//                        settingsViewModel.imageState =  .error
//                        return
//                    }
//                    settingsViewModel.imageData = data
//                    photoGalleryImage = Image(uiImage: uiImage)
//                    settingsViewModel.imageState = .loaded
//                }
//            }
//            .onAppear {
//                if let savedUserName = settingsViewModel.savedUserName {
//                    userName = savedUserName
//                }
//                if let savedImageData = settingsViewModel.savedUserImageData,
//                   let uiImage = UIImage(data: savedImageData) {
//                    photoGalleryImage = Image(uiImage: uiImage)
//                    settingsViewModel.imageState = .loaded
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    SettingsView(settingsViewModel: SettingsViewModel())
//}
//
