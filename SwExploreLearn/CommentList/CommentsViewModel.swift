//
//  CommentsViewModel.swift
//  SwExploreLearn
//
//  Created by AMIT on 09/08/24.
//

import Foundation
import Combine

class CommentsViewModel: ObservableObject {
    @Published var comments: [CommentModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchComments() {
        isLoading = true
        errorMessage = nil
        
        APIManager.shared.fetchData(from: .getComments, responseType: [CommentModel].self)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] comments in
                self?.comments = comments
            })
            .store(in: &cancellables)
    }
}
