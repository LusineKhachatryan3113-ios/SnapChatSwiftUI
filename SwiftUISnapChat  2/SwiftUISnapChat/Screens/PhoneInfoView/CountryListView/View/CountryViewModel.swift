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
    @Published var countryRepository: CountryRepository
    
    init(countryRepository: CountryRepository) {
        self.countryRepository = countryRepository
    }
    
    func errorState() -> CountryViewModel {
        let fetcher = CountryViewModel(countryRepository: CountryRepository())
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    func example1() -> Country {
        return Country(id: "", code: "AF", dialCode: "+93", name: "Afghanistan")
        
    }
    
    func example2() -> Country {
        return Country(id: "", code: "AX", dialCode: "+358", name: "Aland Islands")
        
    }
    
    func successState() -> CountryViewModel   {
        let fetcher = CountryViewModel(countryRepository: CountryRepository())
        fetcher.countries = [example1(), example2()]
        return fetcher
    }
    
    func getflag(country:String) -> String {
        let base : UInt32 = 127397
        var flag = ""
        for v in country.unicodeScalars {
            flag.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return flag
    }
    
    func onTapFetch(completion: @escaping ([Country]) -> ()) {
        countryRepository.fetchCountry { (countries) in
            completion(countries)
        }
    }
}


