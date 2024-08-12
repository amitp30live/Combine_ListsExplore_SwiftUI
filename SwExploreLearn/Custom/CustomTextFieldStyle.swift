//
//  CustomTextFieldStyle.swift
//  SwExploreLearn
//
//  Created by JV on 12/08/24.
//

import SwiftUI


// MARK: - Reusable TextFieldStyle
struct CustomTextFieldStyle: ViewModifier {
    var isFilled: Bool

    func body(content: Content) -> some View {
        content
            .padding()
            .background(RoundedRectangle(cornerRadius: 10)
                .strokeBorder(isFilled ? Color.blue : Color.gray.opacity(0.4), lineWidth: 2))
            .padding(.horizontal, 30)
    }
}

// MARK: - Reusable ButtonStyle
struct CustomButtonStyle: ViewModifier {
    var isEnabled: Bool

    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(isEnabled ? .white : .black)
            .padding()
            .frame(maxWidth: .infinity)
            .background(isEnabled ? Color.blue : Color.white.opacity(0.5))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isEnabled ? Color.white : Color.gray.opacity(0.4), lineWidth: 2)
            )
            .shadow(color: isEnabled ? Color.blue.opacity(0.4) : Color.clear, radius: 10, x: 0, y: 10)
            .padding(.horizontal, 30)
            .animation(.easeInOut(duration: 0.2), value: isEnabled)
    }
}

// MARK: - Custom TextField and SecureField
struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        TextField(placeholder, text: $text)
            .modifier(CustomTextFieldStyle(isFilled: !text.isEmpty))
    }
}

struct CustomSecureField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        SecureField(placeholder, text: $text)
            .modifier(CustomTextFieldStyle(isFilled: !text.isEmpty))
    }
}
