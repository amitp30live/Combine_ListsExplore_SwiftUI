//
//  PostsViewModel.swift
//  SwExploreLearn
//
//  Created by AMIT on 09/08/24.
//

import Foundation
import Combine

class PostsViewModel: ObservableObject {
    @Published var posts: [PostModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchPosts() {
        isLoading = true
        errorMessage = nil
        
        APIManager.shared.fetchData(from: .getPosts, responseType: [PostModel].self)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] posts in
                self?.posts = posts
            })
            .store(in: &cancellables)
    }
}
