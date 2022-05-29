//
//  LogInManager.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 5/1/22.
//


import SwiftUI

class LogInViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var alertisPresented: Bool = false
    @Published var isfocusAble: [Bool] = [true, false]
    @Published var isRevealed: Bool  = false
    @Published var formViewModel = FormViewModel()
    
}



 
 

    


