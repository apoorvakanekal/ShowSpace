//
//  CustomViews.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 11/9/23.
//

import Foundation
import SwiftUI

struct CustomTextField: View {
    
    var placeHolder: String
    var imageName: String
    var opacity: Double
    @Binding var value: String
    
    var body: some View {
        HStack{
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.leading, 20)
                .foregroundColor(Color(DesignConstants.textColor.opacity(opacity)))
            
            if placeHolder == "Password" || placeHolder == "Confirm Password"{
                ZStack (alignment: .leading){
                    if value.isEmpty {
                        Text(placeHolder)
                            .foregroundColor(Color(DesignConstants.textColor.opacity(opacity)))
                            .padding(.leading, 12)
                            .font(.subheadline)
                    }
                    SecureField("", text: $value)
                        .padding(.leading, 12)
                        .font(.caption)
                        .frame(height: 45)
                }
            }
            else{
                ZStack (alignment: .leading){
                    if value.isEmpty {
                        Text(placeHolder)
                            .foregroundColor(Color(DesignConstants.textColor.opacity(opacity)))
                            .padding(.leading, 12)
                            .font(.subheadline)
                    }
                    TextField("", text: $value)
                        .padding(.leading, 12)
                        .font(.caption)
                        .frame(height: 45)
                        .foregroundColor(Color(DesignConstants.textColor))
                }
            }
        }
        .overlay(
        Divider()
            .overlay(
                Color(DesignConstants.textColor).opacity(opacity)
            ).padding(.horizontal, 20)
        , alignment: .bottom
        )
    }
}

struct CustomButton: View {
    
    var title: String
    var bgColor: String
    
    var body: some View {
        Text(title)
            .fontWeight(.bold)
            .foregroundColor(Color(bgColor))
            .frame(height: 58)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color(DesignConstants.textColor))
            .cornerRadius(5)
    }
}
