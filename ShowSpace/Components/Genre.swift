//
//  Genre.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 11/2/23.
//

import Foundation
import SwiftUI

struct Genre<Content: View>: View {
    var content: () -> Content
    var body: some View{
        HStack (content: content)
            .border(Color("show-yellow"))
            .cornerRadius(2.0)
            .frame(height: 30)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
    }
}

