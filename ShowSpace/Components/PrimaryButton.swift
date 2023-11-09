//
//  PrimaryButton.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 10/31/23.
//

import Foundation
import SwiftUI

struct PrimaryButton: View {
    
    @AppStorage("isAddedToList") private var isAddedToList = false
    
    
    var body: some View{
        Button(action: {
            self.isAddedToList.toggle()
        }) {
            ZStack{
                RoundedRectangle(cornerRadius: 3.0)
                    .foregroundColor((Color("bright purple")))
                    .frame(height: 45)
                HStack{
                    if isAddedToList{
                        Text("Added to List")
                            .foregroundColor(.white)
                            .font(.caption2)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                            .imageScale(.small)
                    }
                    else{
                        Text("Add to List?")
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
struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton()
    }
}
