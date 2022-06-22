//
//  APIServiceGeneric.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 6/19/22.
//

import Foundation

struct ApiServiceGeneric: APISesseionUser {
    static let shared = APIServiceUser()
    func login<T>(credentials: T, completion: @escaping (Result<Bool, Error>) -> Void) where T : Decodable {
         APIServiceUser.shared.login(credentials: credentials as! Credentials) { (result:Result<Bool, Authentication.AuthenticationError>) in
            switch result {
                case .success:
                    completion(.success(true))
                case .failure(let authError):
                    completion(.failure(authError))
            }
        }
        }
    }
    
  

