//
//  CountryEndPoint.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 6/5/22.
//
//
import Foundation

enum CountryEndpoint {
    
    case countryList
}

extension CountryEndpoint: RequestBuilder {
    var urlRequest: URLRequest {
        switch self {
        case .countryList:
            guard let url = URL(string: "https://gist.githubusercontent.com/anubhavshrimal/75f6183458db8c453306f93521e93d37/raw/f77e7598a8503f1f70528ae1cbf9f66755698a16/CountryCodes.json")
                else {preconditionFailure("Invalid URL format")}
            let request = URLRequest(url: url)
            return request
        }
        
    }
}

