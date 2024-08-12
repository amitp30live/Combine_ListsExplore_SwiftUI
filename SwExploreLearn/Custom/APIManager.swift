//
//  APIManager.swift
//  SwExploreLearn
//
//  Created by AMIT on 09/08/24.
//

import Foundation
import Combine

class APIManager {
    
    static let shared = APIManager()
    private init() {}
    
    func fetchData<T: Codable>(from endpoint: APIEndpoint,
                               parameters: [String: String]? = nil,
                               responseType: T.Type) -> AnyPublisher<T, APIError> {
        guard var urlComponents = URLComponents(string: endpoint.rawValue) else {
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
        }
        
        if let parameters = parameters {
            urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        
        guard let url = urlComponents.url else {
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw APIError.responseError("Invalid response from server")
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                if let apiError = error as? APIError {
                    return apiError
                } else {
                    return APIError.decodingError(error.localizedDescription)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

enum APIError: Error {
    case invalidURL
    case responseError(String)
    case decodingError(String)
}
