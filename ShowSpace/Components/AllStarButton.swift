//
//  AllStarButton.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 10/31/23.
//

import Foundation
import SwiftUI

struct AllStarButton: View {
    
    @AppStorage("isAddedToAllStars") private var isAddedToAllStars = false
    
    var body: some View{
        Button(action: {
            self.isAddedToAllStars.toggle()
        }) {
            ZStack{
                RoundedRectangle(cornerRadius: 3.0)
                    .foregroundColor((Color("show-yellow")))
                    .frame(height: 45)
                HStack{
                    if isAddedToAllStars{
                        Text("Added to All Stars?")
                            .foregroundColor(.white)
                            .font(.caption2)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                            .imageScale(.small)
                    }
                    else{
                        Text("Add to All Stars?")
                            .foregroundColor(.white)
                            .font(.caption2)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .imageScale(.small)
                    }
                }
                .padding(10)
            }
        }
    }
}

struct AllStarButton_Previews: PreviewProvider {
    static var previews: some View {
        AllStarButton()
    }
}
