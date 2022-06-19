//
//  LoginButton.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 6/19/22.
//

import SwiftUI

struct LoginButtonView: View {
    @State var credentials = Credentials()
    @State var showProgressView = false
    @State var onTap: (() -> Void)?
    @StateObject  var authentication =  Authentication()
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 180, height: 40)
                .overlay(
                    Text(LocalizedStringKey.init("logIn"))
                        .foregroundColor(.white)
                )
            
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        } .onTapGesture {
            onTap?()
            
        }
    }
    
}

