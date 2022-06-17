//
//  CountryService.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 6/5/22.
//
import Foundation
import Combine
import RealmSwift
import SwiftUI


protocol CountryService {
    
    func getCountryList() -> AnyPublisher<[Country], APIError>
}

class RealCountryService: CountryService {
    
    @Published var countries: [Country] = []
    
    private let session = APISession()
    
    private(set) var localRealm: Realm?
    
    @Published var savedData: [CountryList] = []
    
    @ObservedResults(CountryList.self) var city
    

    func getCountryList() -> AnyPublisher<[Country], APIError> {
        let dataFromServer = countryRequest()
        let dataFromCoreData = countryDataVoid()
        return Publishers
            .MergeMany([dataFromServer, dataFromCoreData])
            .eraseToAnyPublisher()
    }

    func countryRequest() -> AnyPublisher<[Country], APIError> {
        let model = Countries.init(countries: countries)
        return session.request(with: CountryEndpoint.countryList)
            .handleEvents(receiveOutput: { [self] countries in
                saveInRealm(model: model)
            }) .eraseToAnyPublisher()
    }
    
    private func getData() -> AnyPublisher<Countries, APIError> {
        
        return session.request(with: CountryEndpoint.countryList)
    }

    private func getDatafromRealm() -> [Country] {
        if let localRealm = localRealm {
            let allCountries = localRealm.objects(CountryList.self)
            allCountries.forEach { country in
                savedData.append(country)
                country.name = countries.first!.name
            }
        }
        return countries
    }

    private func countryDataVoid() -> AnyPublisher<[Country], APIError> {
        Just<Void>(())
            .setFailureType(to: APIError.self)
            .map {
                return getDatafromRealm()
            }
            .eraseToAnyPublisher()
        
        }
    
private func saveInRealm(model: Countries) {
      let realm = try? Realm()
      model.countries.forEach { country in
        do {
          let count = CountryList()
          try realm?.write {
            count.name = country.name
            count.code = country.code
            count.dialCode = country.dialCode
            realm?.add(count)
          }
        } catch {
          print(error)
        }
      }
    }
  }


