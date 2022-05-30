//
//  CountryRepository.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 5/1/22.
//

import Foundation
import Combine
  
func fetchCountry(completion: @escaping ([Country]) -> ()) {
       guard  let url = URL(string: "https://gist.githubusercontent.com/anubhavshrimal/75f6183458db8c453306f93521e93d37/raw/f77e7598a8503f1f70528ae1cbf9f66755698a16/CountryCodes.json") else { return }
       URLSession.shared.dataTask(with: url) { [weak self]  data, _, error in
           guard let data = data, error == nil else {
               return
           }
           do {
               let countries = try JSONDecoder().decode([Country].self, from: data)
               DispatchQueue.main.async {
                   completion(countries)
               }
           }
           catch {
               self?.errorMessage =  error.localizedDescription
               print(error)
           }
       }
       .resume()
   }
}



     
