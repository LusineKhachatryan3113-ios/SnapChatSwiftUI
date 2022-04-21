//
//  SearchBar.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 4/12/22.
//

import SwiftUI

struct SearchBar: View {

    @Binding var searchText: String
    @Binding var searching: Bool

     var body: some View {
        VStack(alignment: .leading) {
            SearchBar(searchText: $searchText, searching: $searching)
         ZStack {
             Rectangle()
                 .foregroundColor(Color("LightGray"))
             HStack {
                 Image(systemName: "magnifyingglass")
                TextField("Search ..", text: $searchText) { startedEditing in
                    if startedEditing {
                        withAnimation {
                            searching = true
                        }
                    }
                } onCommit: {
                    withAnimation {
                        searching = false
                    }
                }

             }
             .foregroundColor(.gray)
             .padding(.leading, 13)
         }
             .frame(height: 40)
             .cornerRadius(13)
             .padding()
     }

 }
}
