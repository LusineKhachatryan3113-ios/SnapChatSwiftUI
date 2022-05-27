//
//  PhoneInfoManager.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 5/1/22.
//

import Foundation

class PhoneInfoViewModel: ObservableObject {
    
    @Published var alertisPresented: Bool = false
    @Published var isRevealed: Bool = false
    @Published var countryCode: String = ""
    @Published var countryFlag: String = ""
    @Published var isfocusAble: [Bool] = [true, false]
    @Published var formViewModel = FormViewModel()
    
}

