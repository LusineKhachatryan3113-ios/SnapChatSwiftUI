//
//  CountryService.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 6/5/22.
//

import Foundation
import Combine

protocol CountryService {
    var apiSession: APIService {get}
    
    func getCountryList() -> AnyPublisher<[Country], APIError>
}
extension CountryService {
    
    func getCountryList() -> AnyPublisher<[Country], APIError> {
        return apiSession.request(with: CountryEndpoint.countryList, type: [Country].self)

    }
}
