//
//  AccountView.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 10/30/23.
//

import Foundation
import SwiftUI

struct AccountView: View {
    var body: some View {
        ZStack{
            DesignConstants.bgColor
                .ignoresSafeArea()
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Account")
                    .foregroundColor(DesignConstants.textColor)
            }
        }
    }
}
