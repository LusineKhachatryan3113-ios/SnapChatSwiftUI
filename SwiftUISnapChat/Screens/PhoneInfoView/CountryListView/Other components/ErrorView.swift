//
//  ErrorView.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 4/28/22.
//

import SwiftUI
import Combine

struct ErrorView: View {
    @StateObject var countryRepository = CountryViewModel(countryRepository: CountryRepository())
    var body: some View {
        VStack {
            Text("😭")
                .font(.system(size: 80))
            Text(countryRepository.errorMessage ?? "")
        }
    }
}

