//
//  AccountView.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 11/13/23.
//

import SwiftUI
import UIComponents

struct AccountView: View {
    
    @State var isSettingViewActive = false
    @State private var isShowingAllStarsShows = true
    @State private var isShowingAddedToListShows = false
    @ObservedObject var viewModel = AccountViewModel()
    @ObservedObject var sharedShowViewModel = ShowViewModel()
    
    
    var body: some View {
        
        NavigationStack {
            NavigationView{
                    VStack {
                        if let data = viewModel.profileData, let profileImage = UIImage(data: data) {
                            Image(uiImage: profileImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 90, height: 90)
                                .clipShape(Circle())
                                .padding(.bottom, DesignConstants.showPadding)
                        } else {
                            Image("defaultPerson")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 90, height: 90)
                                .clipShape(Circle())
                                .padding(.bottom, DesignConstants.showPadding)
                        }
                        Text("\(viewModel.userName)")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(DesignConstants.textColor)
                            .padding(.bottom, 10)
                        Spacer()
                        Divider()
                            .overlay(Color("cool purple"))
                        VStack (alignment: .leading){
                            Text("Currently Watching")
                                .foregroundColor(DesignConstants.textColor)
                                .font(.headline)
                                .padding(.vertical, 10)
                            CurrentlyWatchingListView(showViewModel: sharedShowViewModel)
                                .frame(maxWidth: .infinity)
                                .background(DesignConstants.bgColor)
                                .cornerRadius(3)
                                .environment(\.colorScheme, .dark)
                            Divider()
                                .overlay(Color("cool purple"))
                            HStack{
                                Button(action: {
                                    isShowingAllStarsShows = true
                                    isShowingAddedToListShows = false
                                }) {
                                    if isShowingAllStarsShows{
                                        Text("All Stars")
                                            .padding(10)
                                            .background(Color("cool purple"))
                                            .foregroundColor(.white)
                                            .cornerRadius(3)
                                    }
                                    else{
                                        Text("All Stars")
                                            .padding(10)
                                            .background(Color("cool purple"))
                                            .foregroundColor(.white)
                                            .cornerRadius(3)
                                            .opacity(0.3)
                                    }
                                }
                                .padding(.vertical, 10)
                                
                                Button(action: {
                                    isShowingAddedToListShows = true
                                    isShowingAllStarsShows = false
                                }) {
                                    if isShowingAddedToListShows{
                                        Text("My List")
                                            .padding(10)
                                            .background(Color("cool purple"))
                                            .foregroundColor(.white)
                                            .cornerRadius(3)
                                    }
                                    else{
                                        Text("My List")
                                            .padding(10)
                                            .background(Color("cool purple"))
                                            .foregroundColor(.white)
                                            .cornerRadius(3)
                                            .opacity(0.3)
                                    }
                                }
                                .padding(.vertical, 10)
                            }
                            
                            if isShowingAllStarsShows {
                                AllStarsShowsListView(showViewModel: sharedShowViewModel)
                                    .frame(maxWidth: .infinity)
                                    .background(DesignConstants.bgColor)
                                    .cornerRadius(3)
                                    .environment(\.colorScheme, .dark)
                            }
                            if isShowingAddedToListShows {
                                AddedToListShowsListView(showViewModel: sharedShowViewModel)
                                    .frame(maxWidth: .infinity)
                                    .background(DesignConstants.bgColor)
                                    .cornerRadius(3)
                                    .environment(\.colorScheme, .dark)
                            }
                        }
                    }
                    .padding(DesignConstants.showPadding)
                }
                .toolbar{
                    Button{
                        viewModel.setDataForSettingsView()
                        isSettingViewActive.toggle()
                    }label: {
                        Image(systemName: "person")
                            .padding(DesignConstants.showPadding)
                            .foregroundColor(DesignConstants.textColor)
                    }
                }
                .navigationDestination(isPresented: $isSettingViewActive) {
                    EditProfileView(userProfileViewModel: viewModel.userProfileViewModel)
                }
        }
        .navigationBarBackButtonHidden(true)
        .environment(\.colorScheme, .dark)
    }
}
                    
struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
