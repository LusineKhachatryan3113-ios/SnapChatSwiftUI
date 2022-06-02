//
//  CountryRepository.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 5/1/22.
//

import Foundation
import Combine

class CountryRepository {
    
private var apiRepository: ApiRepository =  ApiRepository()
  let url = URL(string: "https://gist.githubusercontent.com/anubhavshrimal/75f6183458db8c453306f93521e93d37/raw/f77e7598a8503f1f70528ae1cbf9f66755698a16/CountryCodes.json")
    
    func fetch<Country: Decodable>(url: URL) -> AnyPublisher<Country, APIError> {
        let request = URLRequest(url: url)
        return URLSession.DataTaskPublisher(request: request, session: .shared)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    throw APIError.unknown
                }
                return data as! Country
            }
            .mapError { error in
                if let error = error as? APIError {
                    return error
                } else {
                   return APIError.badURL
                }
            }
            .eraseToAnyPublisher()
    }


}


     
