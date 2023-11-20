//
//  SignUpView.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 11/13/23.
//

import Foundation
import SwiftUI

struct SignUpView: View {
    
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var email: String = ""
    @State private var cpassword: String = ""
    @State var isLinkActive = false
    
    var body: some View {
        ZStack{
            DesignConstants.bgColor
                .ignoresSafeArea()
            ZStack(alignment: .topLeading){
                VStack{
                    VStack (spacing: 40){
                        ZStack{
                            Ellipse()
                                .frame(width: 458, height: 450)
                                .padding(.trailing, -400)
                                .foregroundColor(Color("show-yellow"))
                                .padding(.top, -300)
                            
                            Text("Create \nAccount")
                                .foregroundColor(DesignConstants.textColor)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 20)
                                .padding(.top, 100)
                        }
                        VStack (spacing: 20){
                            
                            VStack (spacing: 30){
                                CustomTextField(placeHolder: "Name", imageName: "person", opacity: 1.0, value: $name)
                                CustomTextField(placeHolder: "Email", imageName: "lock", opacity: 1.0, value: $email)
                                CustomTextField(placeHolder: "Password", imageName: "lock", opacity: 1.0, value: $password)
                                CustomTextField(placeHolder: "Confirm Password", imageName: "lock", opacity: 1.0, value: $cpassword)
                            }
                            VStack (alignment: .trailing){
                                NavigationLink {
                                    AccountView()
                                } label: {
                                    Text("Sign In")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("cool purple"))
                                        .frame(height: 58)
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                        .background(Color(DesignConstants.textColor))
                                        .cornerRadius(5)
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 20)
                        }
                    }
                }
            }
        }
    }
}

