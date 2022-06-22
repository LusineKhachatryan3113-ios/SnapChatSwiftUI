//
//  LogInManager.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 5/1/22.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    private let userService: UserService
    var credentials = Credentials()
    @Published var showProgressView = false
    @Published var error: Authentication.AuthenticationError?
    
    init(userService: UserService) {
        self.userService = userService
    }
    func login(completion: @escaping (Bool) -> Void) {
        userService.login(credentials: credentials) { (result) in
            switch result {
                case .success:
                    completion(true)
                case .failure(let authError):
                    self.error = authError
                    completion(false)
            }
        }
    }
}
    

   

    









 
 

    


