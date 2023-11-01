//
//  AllStarButton.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 10/31/23.
//

import Foundation
import SwiftUI

struct AllStarButton: View {
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 3.0)
                .foregroundColor((Color("show-yellow")))
                .frame(height: 45)
            HStack{
                Text("Add to All Stars")
                    .foregroundColor(.white)
                    .font(.caption2)
                Spacer()
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .imageScale(.small)
            }
            .padding(10)
        }
    }
}

struct AllStarButton_Previews: PreviewProvider {
    static var previews: some View {
        AllStarButton()
    }
}
