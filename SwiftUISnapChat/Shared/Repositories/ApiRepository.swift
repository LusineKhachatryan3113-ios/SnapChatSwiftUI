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








/*
 
 //
 //   func fetch<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void )  {
 //     URLSession.shared.dataTaskPublisher(for: url)
 //        .map { $0.data }
 //        .decode(type: T.self, decoder: JSONDecoder())
 //        .receive(on: DispatchQueue.main)
 //        .sink { (resultCompletion) in
 //                        switch resultCompletion {
 //                        case .failure(let error):
 //                            completion(.failure(error))
 //                        case .finished:
 //                           break
 //                        }
 //                    } receiveValue: { (resultArr) in
 //                        completion(.success(resultArr))
 //                    }
 //     .store(in: &subscriber)
 //
 //
 //   }
 //}
 
 
 
 */
