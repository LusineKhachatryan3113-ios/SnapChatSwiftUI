//
//  RegisterViewModel.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 5/12/22.
//


import Foundation

class RegisterViewModel: ObservableObject {
    @Published var formViewModel = FormViewModel()
    @Published var email = ""
    @Published var password = ""
    @Published var alertisPresented: Bool = false
    @Published var isfocusAble: [Bool] = [true, false]
    @Published var isRevealed: Bool  = false
}
