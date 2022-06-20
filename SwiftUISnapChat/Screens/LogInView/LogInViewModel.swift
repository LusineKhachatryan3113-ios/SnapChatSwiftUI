//
//  LogInManager.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 5/1/22.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var credentials = Credentials()
    @Published var showProgressView = false
    @Published var error: Authentication.AuthenticationError?
    func login(completion: @escaping (Bool) -> Void) {
        showProgressView = true
        APIServiceUser.shared.login(credentials: credentials) {[unowned self] (result: Result<Bool, Authentication.AuthenticationError>) in
           showProgressView = false
            switch result {
                case .success:
                    completion(true)
                case .failure(let authError):
                    credentials = Credentials()
                    error = authError
                    completion(false)
            }
        }
    }
}

   

    









 
 

    


