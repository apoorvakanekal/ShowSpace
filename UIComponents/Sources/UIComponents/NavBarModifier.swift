//
//  NavBarModifier.swift
//  ViewNavigation
//
//  Created by jhonathan briceno on 9/20/23.
//

import Foundation
import SwiftUI

public struct NavigationBar: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(Color.blue, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
    }
}


public extension View {
    func blueNavigationBar() -> some View {
        modifier(NavigationBar())
    }
}
