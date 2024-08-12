//
//  UsersViewModel.swift
//  SwExploreLearn
//
//  Created by AMIT on 09/08/24.
//

import Foundation
import Combine

class UsersViewModel: ObservableObject {
    @Published var users: [UserModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchUsers() {
        isLoading = true
        errorMessage = nil
        
        APIManager.shared.fetchData(from: .getUsers, responseType: [UserModel].self)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] users in
                self?.users = users
            })
            .store(in: &cancellables)
    }
}
