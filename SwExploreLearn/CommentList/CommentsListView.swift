//
//  CommentsListView.swift
//  SwExploreLearn
//
//  Created by AMIT on 09/08/24.
//

import SwiftUI

struct CommentsListView: View {
    @StateObject private var viewModel = CommentsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else {
                    List(viewModel.comments) { comment in
                        VStack(alignment: .leading) {
                            Text(comment.name)
                                .font(.headline)
                            Text(comment.body)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Comments")
            .onAppear {
                viewModel.fetchComments()
            }
        }
    }
}
