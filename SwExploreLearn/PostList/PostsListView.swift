//
//  PostsListView.swift
//  SwExploreLearn
//
//  Created by AMIT on 09/08/24.
//

import SwiftUI

struct PostsListView: View {
    @StateObject private var viewModel = PostsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else {
                    List(viewModel.posts) { post in
                        VStack(alignment: .leading) {
                            Text(post.title)
                                .font(.headline)
                            Text(post.body)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Posts")
            .onAppear {
                viewModel.fetchPosts()
            }
        }
    }
}
