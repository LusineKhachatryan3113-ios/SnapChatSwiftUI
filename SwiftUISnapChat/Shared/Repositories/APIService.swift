//
//  APIService.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 4/29/22.
//
//

import Foundation
import Combine

protocol APIService {
    func request<T>(with builder: RequestBuilder, type: T.Type) -> AnyPublisher<T, APIError> where T: Decodable
}

