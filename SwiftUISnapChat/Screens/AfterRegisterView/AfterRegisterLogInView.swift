//
//  GoToLogInView.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 3/24/22.
//


import SwiftUI

struct AfterRegisterLogInView: View {
    @State var isLoggedIn: Bool = false
    @EnvironmentObject var authentication: Authentication
    var body: some View {
        NavigationView {
            VStack {
                Text("Authorized.. You are in")
                    .font(.largeTitle)
              }
            .padding()
            .navigationTitle("My secure App")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Log out") {
                        authentication.updateValidation(success: false)
                        
                    }
                }
            }
        }
    }
}

