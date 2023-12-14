//
//  PrimaryButton.swift
//  ShowSpace
//
//  Created by Apoorva Kanekal on 10/31/23.
//

import Foundation
import SwiftUI

struct ShowsButton: View {
    
    private var buttonTitle: String
    private var imageName: String
    private var backgroundColor: Color
    private var onClick: (() -> Void)?

    init(buttonTitle: String, imageName: String,  background: Color, onClick: (() -> Void)? = nil) {
        self.buttonTitle = buttonTitle
        self.imageName = imageName
        self.backgroundColor = background
        self.onClick = onClick
    }
    
    var body: some View {
        Button {
            onClick?()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 3.0)
                    .foregroundColor(backgroundColor)
                    .frame(height: 50)
                HStack{
                    Text(buttonTitle)
                        .foregroundColor(.white)
                        .font(.caption2)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Image(systemName: imageName)
                        .foregroundColor(.white)
                        .imageScale(.small)
                }
                .padding(10)
            }
        }
    }
}
