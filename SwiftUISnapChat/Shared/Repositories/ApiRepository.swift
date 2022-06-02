//
//  ApiRepository.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 6/1/22.
//

import Foundation
import Combine

class ApiRepository {
      
    func fetch<T: Decodable>(url: URL) -> AnyPublisher<T, APIError> {
        let request = URLRequest(url: url)
        
        return URLSession.DataTaskPublisher(request: request, session: .shared)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    throw APIError.unknown
                }
                return data as! T
            }
            .mapError { error in
                if let error = error as? APIError {
                    return error
                } else {
                    return APIError.badURL
                }
            }
            .eraseToAnyPublisher()
    }   
}



