//
//  GoToView.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 4/28/22.
//

import SwiftUI
import Combine

struct GeneralList: View {
    @StateObject var viewModel = CountryViewModel(countryRepository: CountryRepository())
    var body: some View {
        VStack {
            if viewModel.errorMessage != nil {
                ErrorView()
            } else {
                CountryListView(countries: viewModel.countries)
          }
        }
    }
}
struct GoToView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralList()
    }
}

