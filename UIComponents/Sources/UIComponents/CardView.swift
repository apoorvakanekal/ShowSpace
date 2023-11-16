//
//  SwiftUIView.swift
//  
//
//  Created by jhonathan briceno on 11/4/23.
//

import SwiftUI

public enum CardSize {
    case small
    case smallCenter
    case large
    
    func fontSize() -> CGFloat {
        switch self {
        case .small, .smallCenter:
            return 16
        case .large:
            return 32
        }
    }
    
    func cardHeight() -> CGFloat {
        switch self {
        case .small, .smallCenter:
            return 45
        case .large:
            return 175
        }
    }
}

public struct CardView: View {
    
    let imageName: String
    let text: String
    let size: CardSize
    let customFontSize: CGFloat?
    
    public init(imageName: String, text: String, cardSize: CardSize, customFontSize: CGFloat? = nil) {
        self.imageName = imageName
        self.text = text
        self.size = cardSize
        self.customFontSize = customFontSize
    }
    
    public var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .background(.regularMaterial)
            if size == .small {
                HStack {
                    Text(text)
                        .font(.system(size: customFontSize ?? size.fontSize(), weight: .heavy))
                        .background(Color.white)
                        .foregroundColor(.black)
                    if size == .small {
                        Spacer()
                    }
                }
                .padding(.horizontal, 16)
            } else {
                Text(text)
                    .font(.system(size: customFontSize ?? size.fontSize(), weight: .heavy))
                    .background(Color.white)
                    .foregroundColor(.black)
            }

        }
        .frame(height: size.cardHeight())
        .cornerRadius(10)
        .shadow(color: .gray, radius: 5)
        .padding(.horizontal, 16)
    }
}

#Preview {
    CardView(imageName: "", text: "test", cardSize: .large)
}
