//
//  ViewModel.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 5/5/22.
//


import Foundation
import Combine
import SwiftUI

class CountryListViewModel: ObservableObject, CountryService {
    var apiSession: APIService
    @Published var countries = [Country]()
    var cancellables = Set<AnyCancellable>()
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }
    func getflag(country:String) -> String {
        let base : UInt32 = 127397
        var flag = ""
        for v in country.unicodeScalars {
            flag.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return flag
    }
    func getCountryList() {
        let cancellable = self.getCountryList()
            .sink(receiveCompletion: { result in
                switch result {
                    case .failure(let error):
                        print("Handle error: \(error)")
                    case .finished:
                        break
                }
                
            }) { (countries) in
                self.countries = countries
            }
        cancellables.insert(cancellable)
    }
}
