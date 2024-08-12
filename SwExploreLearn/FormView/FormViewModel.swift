//
//  FormViewModel.swift
//  SwExploreLearn
//
//  Created by AMIT on 09/08/24.
//

import Foundation
import Combine

class FormViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    
    @Published var isSubmitAllowed: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // Combine the latest values of username and password
        Publishers.CombineLatest($username, $password)
            .map { username, password in
                return !username.isEmpty && password.count >= 8
            }
            .assign(to: \.isSubmitAllowed, on: self)
            .store(in: &cancellables)
    }
}
