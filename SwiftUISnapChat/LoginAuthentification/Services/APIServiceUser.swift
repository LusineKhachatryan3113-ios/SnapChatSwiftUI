//
//  APIServiceUser.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 6/17/22.
//

import Foundation

protocol RealUserService {
    
    func login(credentials: Credentials, completion: @escaping (Result<Bool, Authentication.AuthenticationError>) -> Void)
}

class APIServiceUser: RealUserService {
    
    static let shared = APIServiceUser()
    
    func login(credentials: Credentials, completion: @escaping (Result<Bool, Authentication.AuthenticationError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if credentials.password == "password" && credentials.email == "Lusin@mail.ru" {
                completion(.success(true))
            } else {
                completion(.failure(.invalidCredentials))
            }
        }
        }
    
    
}

