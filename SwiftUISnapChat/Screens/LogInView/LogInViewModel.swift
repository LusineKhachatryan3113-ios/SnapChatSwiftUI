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
    
    var loginDisabled: Bool {
        credentials.email.isEmpty || credentials.password.isEmpty
    }
    
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

   

    








// @Published var email = ""
// @Published var password = ""
    
//    //MARK: - Validation Functions
//
//    func isPasswordValid() -> Bool {
//        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$")
//        return passwordTest.evaluate(with: password)
//    }
//
//    func isEmailValid() -> Bool {
//        let emailTest = NSPredicate(format: "SELF MATCHES %@", "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
//        return emailTest.evaluate(with: email)
//    }
//
//    var isSignUpComplete: Bool {
//        if !isPasswordValid() ||
//            !isEmailValid() {
//            return false
//        }
//        return true
//    }
//
//    //MARK: - Validation Prompt Strings
//
//    var emailPrompt: String {
//        if isEmailValid(){
//            return ""
//        } else {
//            return "Enter a valid email address"
//
//        }
//    }
//
//    var passwordPrompt: String {
//        if isPasswordValid() {
//            return ""
//        } else {
//            return "Must be between 8 and 15 characters containing at least one number and one capital letter"
//        }
//    }
//    func signup() {
//         email = ""
//         password = ""
//    }
//}




 
 

    


