//
//  HideNavigationBar.swift
//  SwExploreLearn
//
//  Created by JV on 12/08/24.
//

import Foundation
import SwiftUI
//ViewModifiers.swift

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}
