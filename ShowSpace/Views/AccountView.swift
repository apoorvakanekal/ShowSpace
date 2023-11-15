//
//  AccountView.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 11/13/23.
//

import Foundation
import SwiftUI

struct AccountView: View {
    var body: some View {
        ZStack{
            DesignConstants.bgColor
                .ignoresSafeArea()
            VStack{
                HStack(alignment:.center) {
                    Circle()
                        .frame(width: 120, height: 70)
                    Spacer()
                    VStack(alignment: .leading){
                        Text("Name")
                            .foregroundColor(DesignConstants.textColor)
                            .font(.headline)
                            .frame(alignment:.leading)
                            .padding(.vertical, 10)
                        Button {
                            
                        } label: {
                            ZStack (alignment: .leading){
                                Rectangle()
                                    .frame(height:30)
                                    .cornerRadius(3)
                                    .foregroundColor(Color("cool purple"))
                                
                                Text("Edit profile")
                                    .foregroundColor(DesignConstants.textColor)
                                    .font(.caption)
                                    .frame(alignment:.leading)
                                    .padding(.leading, 20)
                            }
                        }
                    }
                }
                Divider()
                Spacer()
                HStack{
                    Text("All Stars")
                        .foregroundColor(DesignConstants.textColor)
                    Spacer()
                    Text ("My List")
                        .foregroundColor(DesignConstants.textColor)
                }
                .padding(.horizontal, 60)
                .padding(.bottom, 500)
            }
            .padding(.all, DesignConstants.showPadding)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
