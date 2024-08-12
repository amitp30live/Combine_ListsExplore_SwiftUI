//
//  ContentView.swift
//  SwExploreLearn
//
//  Created by AMIT on 09/08/24.
//
import SwiftUI
import Combine

// MARK: - Main FormView
struct FormView: View {
    @StateObject private var viewModel = FormViewModel()
    @State private var shouldNavigate = false // State to control navigation
    
    var body: some View {
        NavigationStack { // Wrap in NavigationStack
            
            VStack(spacing: 20) {
                // Title
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.vertical, 40)
                
                Spacer()
                
                // Custom TextFields
                CustomTextField(placeholder: "Enter Username", text: $viewModel.username)
                CustomSecureField(placeholder: "Enter Password", text: $viewModel.password)
                    .padding(.bottom, 60)
                
                // Submit Button with custom style
                Button(action: {
                    // Handle form submission
                    print("Form submitted")
                    shouldNavigate = true // Trigger navigation
                }) {
                    Text("Submit")
                }
                .modifier(CustomButtonStyle(isEnabled: viewModel.isSubmitAllowed))
                .disabled(!viewModel.isSubmitAllowed) // Disable button if form is invalid
                
                Spacer()
                
                // NavigationLink using the new API
                NavigationLink(value: shouldNavigate) {
                    EmptyView()
                }
                .navigationDestination(isPresented: $shouldNavigate) {
                    TabbarView() // The destination view
                }
            }
            .padding()
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue.opacity(0.1)]),
                               startPoint: .top,
                               endPoint: .bottom)
            )
        }
    }
}


