//
//  APIError.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 4/28/22.
//


import Foundation

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}

