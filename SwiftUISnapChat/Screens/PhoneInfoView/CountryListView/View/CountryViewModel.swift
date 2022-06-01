//
//  ViewModel.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 5/5/22.
//

import Foundation
import Combine

class CountryViewModel: ObservableObject {
    
    @Published var errorMessage: String? = nil
    @Published  var countries = [Country]()
    private var countryRepository: CountryRepository
    private var bag = Set<AnyCancellable>()
    
    init(countryRepository: CountryRepository) {
        self.countryRepository = countryRepository
    }
    func getflag(country:String) -> String {
        let base : UInt32 = 127397
        var flag = ""
        for v in country.unicodeScalars {
            flag.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return flag
    }
    
func onTapfetch (completion: @escaping ([Country]) -> ()) {
    countryRepository.fetch(url:countryRepository.url!)
     .receive(on: DispatchQueue.main)
     .decode(type: [Country].self, decoder: JSONDecoder())
        .sink { res in
        } receiveValue: { countries in
            completion(countries)
        }
        .store(in: &bag)

}
}
