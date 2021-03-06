//
//  CountryListView.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 4/28/22.
//

import SwiftUI
import Combine

struct CountryListView: View {
    @State var countryCode = ""
    @State var countryFlag = ""
    @ObservedObject var countryvewModel = CountryListViewModel()
    @Environment(\.presentationMode) var presentation
    @State private var searchText: String = ""
    var filteredCountries: [Country] {
        if searchText.count == 0 {
            return countryvewModel.countries
        } else {
            return countryvewModel.countries.filter { $0.name.contains(searchText)}
        }
    }
    var body: some View {
        List {
            Text("Country or Region")
                .modifier(ParameterModifier(width: 200, backgroundColor: .white, foregroundColor: .black, height: 30, alignment: .center, size: 25))
            SearchBar(countries: countryvewModel.countries, searchText: $searchText)
            ForEach(filteredCountries) { country in
                HStack {
                    Text("\(countryvewModel.getflag(country: country.code))")
                    Text(country.name)
                    Spacer()
                    Text(country.dialCode)
                        
                        .background(Color.white)
                        .font(.system(size: 20))
                        .onTapGesture {
                            self.countryCode = country.dialCode
                            self.countryFlag = countryvewModel.getflag(country: country.code)
                            presentation.wrappedValue.dismiss()
                        }
                }
            }
        }
        .onAppear {
            self.countryvewModel.getCountryList()
        }
    }
}

   

            
     
         



