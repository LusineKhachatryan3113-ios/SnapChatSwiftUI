//
//  SearchBar.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 4/12/22.
//

import SwiftUI
import Combine

struct SearchBar: View {
    let countries:[Country]
    @Binding var searchText: String
    var filteredCountries: [Country] {
        if searchText.count == 0 {
            return countries
        } else {
            return countries.filter { $0.name.contains(searchText)}
            }
        }
     var body: some View {
        VStack(alignment: .leading) {
        
         ZStack {
             Rectangle()
                .foregroundColor(Color.white)
             HStack {
                 Image(systemName: "magnifyingglass")
                TextField("Search ..", text: $searchText)
                }
             .foregroundColor(.gray)
             .padding(.leading, 13)
            }
             .frame(height: 20)
             .cornerRadius(13)
            
            }
        }
    }
