//
//  CountriesFilter.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 4/12/22.
//

import SwiftUI

struct CountryRow: View {
    @State var countryCode = ""
    @State var countryFlag = ""
    
    var body: some View {
        Text("Hello world")
        }
   }
struct CountryFilter: View {
    @State var countryCode = ""
    @State var countryFlag = ""
    @State var searchText = ""
    @State var searching = false
    var country =  [Country]()
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                ZStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search ..", text: $searchText)
                        }
                    .foregroundColor(.gray)
                    .padding(.leading, 13)
                    Rectangle()
                        .foregroundColor(Color("LightGray"))
                    }
                .frame(height: 40)
                .cornerRadius(13)
                .padding()
                }
         
          
                ForEach(country.filter({ (countries: Country) -> Bool in
                    return countries.name.hasPrefix(searchText)
                        }), id: \.self) { countries in
                      Text(countries.name)
                
            }

               }
         }

    }
