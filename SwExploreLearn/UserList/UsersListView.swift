//
//  UsersListView.swift
//  SwExploreLearn
//
//  Created by AMIT on 09/08/24.
//

import SwiftUI

struct UsersListView: View {
    @StateObject private var viewModel = UsersViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else {
                    List(viewModel.users) { user in
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.email)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Users")
            .onAppear {
                viewModel.fetchUsers()
            }
        }
        .hiddenNavigationBarStyle()

    }
}


//struct ContentView: View {
//    var body: some View {
//        UsersListView()
//    }
//}
