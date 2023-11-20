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
    @ObservedObject var viewModel = AccountViewModel()
    
    var body: some View {
        
        NavigationStack {
            NavigationView{
                ZStack{
                    DesignConstants.bgColor
                        .ignoresSafeArea()
                    VStack {
                        if let data = viewModel.profileData, let profileImage = UIImage(data: data) {
                            Image(uiImage: profileImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 90, height: 90)
                                .clipShape(Circle())
                                .padding(.bottom, DesignConstants.showPadding)
                                .padding(.top, -100)
                        } else {
                            Image("defaultPerson")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 90, height: 90)
                                .clipShape(Circle())
                                .padding(.bottom, DesignConstants.showPadding)
                                .padding(.top, -100)
                        }
                        Text("\(viewModel.userName)")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(DesignConstants.textColor)
                        Spacer()
                        Divider()
                            .overlay(Color("cool purple"))
                        VStack (alignment: .leading){
                            Text("Currently Watching")
                                .foregroundColor(DesignConstants.textColor)
                                .font(.headline)
                                .padding(.vertical, DesignConstants.showPadding)
                            RoundedRectangle(cornerRadius: 5.0)
                                .frame(height: 100)
                                .padding(.bottom, DesignConstants.showPadding)
                            Divider()
                                .overlay(Color("cool purple"))
                            HStack{
                                Text("All Stars")
                                    .foregroundColor(DesignConstants.textColor)
                                    .font(.headline)
                                    .padding(.vertical, DesignConstants.showPadding)
                                Text("My List")
                                    .foregroundColor(DesignConstants.textColor)
                                    .font(.headline)
                                    .padding(.vertical, DesignConstants.showPadding)
                                    .padding(.leading, 16)
                            }
                        }
                        .padding(.bottom, 250)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(30)
                }
            }
            .toolbar {
                Button {
                    viewModel.setDataForSettingsView()
                    isSettingViewActive.toggle()
                } label: {
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
    }

}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
