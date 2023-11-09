//
//  AccountView.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 11/9/23.
//

import Foundation
import SwiftUI

struct AccountView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
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
                                .frame(width: 458, height: 420)
                                .padding(.trailing, -500)
                                .foregroundColor(Color("show-yellow"))
                                .padding(.top, -200)
                            
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
                                CustomTextField(placeHolder: "Email", imageName: "envelope", tOpacity: 0.6, value: $email)
                                CustomTextField(placeHolder: "Password", imageName: "lock", tOpacity: 0.6, value: $password)
                            }
                            VStack (alignment: .trailing){
                                Button(action:{}, label:{
                                   CustomButton(title: "Sign In", bgColor: "cool purple")
                                })
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                }
            }
        }
    }
}

