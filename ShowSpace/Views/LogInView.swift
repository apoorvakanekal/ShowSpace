//
//  AccountView.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 11/9/23.
//

import Foundation
import SwiftUI

struct LogInView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State var isLinkActive = false
    
    var body: some View {
        NavigationView{
            ZStack{
                DesignConstants.bgColor
                    .ignoresSafeArea()
                ZStack(alignment: .topLeading){
                    VStack{
                        VStack (spacing: 40){
                            ZStack{
                                Ellipse()
                                    .frame(width: 510, height: 478)
                                    .padding(.leading, -200)
                                    .foregroundColor(Color("bright purple"))
                                    .padding(.top, -200)
                                
                                Ellipse()
                                    .frame(width: 458, height: 450)
                                    .padding(.trailing, -400)
                                    .foregroundColor(Color("show-yellow"))
                                    .padding(.top, -300)
                                
                                Text("Sign \nIn")
                                    .foregroundColor(DesignConstants.textColor)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 20)
                            }
                            VStack (spacing: 30){
                                
                                VStack (spacing: 30){
                                    CustomTextField(placeHolder: "Email", imageName: "envelope", opacity: 0.6, value: $email)
                                    CustomTextField(placeHolder: "Password", imageName: "lock", opacity: 0.6, value: $password)
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
                            }
                            VStack{
                                Text("Don't have an account?")
                                    .fontWeight(.bold)
                                    .foregroundColor(DesignConstants.textColor)
                                    .font(.caption)
                                NavigationLink {
                                    SignUpView()
                                } label: {
                                    Text("Sign Up")
                                        .foregroundColor(DesignConstants.textColor)
                                }
                            }
                            .frame(height: 58)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color("show-red"))
                            .cornerRadius(5)
                            .padding(.horizontal, 20)
                        }
                    }
                }
                
            }
        }
    }
}
