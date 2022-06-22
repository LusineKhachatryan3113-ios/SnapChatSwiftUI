//
//  APISessionUser.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 6/19/22.
//

import Foundation
import Combine

protocol APISesseionUser {
    
    func login<T>(credentials: T, completion: @escaping (Result<Bool, Error>) -> Void) where T: Decodable
}

