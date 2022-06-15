//
//  CountryService.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 6/5/22.
//
import Foundation
import Combine
import CoreData
import SwiftUI

protocol CountryService {
    func getCountryList() -> AnyPublisher<[Country], APIError>
}

class RealCountryService: CountryService {
    @Published var countries: [Country] = []
    private let session = APISession()
    @Published var savedData: [Components] = []
    let container: NSPersistentContainer
    init() {
        container = NSPersistentContainer(name: "CountryModel")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
        
    }
    
    func getCountryList() -> AnyPublisher<[Country], APIError> {
        let dataFromServer = countryRequest()
        let dataFromCoreData = countryDataVoid()
        return Publishers
            .MergeMany([dataFromServer, dataFromCoreData])
            .eraseToAnyPublisher()
    }
    
    func countryRequest()  -> AnyPublisher<[Country], APIError> {
        let model = Countries.init(countries: countries)
        return session.request(with: CountryEndpoint.countryList)
            .handleEvents(receiveOutput: { [self] countries in
                saveData(model: model)
            }) .eraseToAnyPublisher()
    }
    
    private func getData() -> AnyPublisher<Countries, APIError> {
        let request = NSFetchRequest<Components>(entityName: "Country")
        do {
            try savedData = container.viewContext.fetch(request)
        } catch {
            print("Error getting data. \(error.localizedDescription)")
        }
        return session.request(with: CountryEndpoint.countryList)
    }
    
    private func saveData(model: Countries) {
        model.countries.forEach { country in
            let city = Components()
            city.name = country.name
            city.code = country.code
            city.dialCode = country.dialCode
        }
        
        try? container.viewContext.save()
    }
    
    private func getDatafromCoreData() -> [Country] {
        let moc = DataController.init().container.viewContext
        let request = NSFetchRequest<Components>(entityName: "Country")
        let data = try? moc.fetch(request)
        data.map { $0.forEach { item in
            item.name! = countries.first?.name ?? "Unknown"
        }}
        return countries
    }
    
    private func countryDataVoid() -> AnyPublisher<[Country], APIError> {
        Just<Void>(())
            .setFailureType(to: APIError.self)
            .map {
                return getDatafromCoreData()
            }
            .eraseToAnyPublisher()
        }
}


