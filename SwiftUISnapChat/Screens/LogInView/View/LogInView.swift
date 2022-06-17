//
//  LogInView.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 3/24/22.
//

import SwiftUI

struct LogInView: View {   
  struct LogInView: View {
    
    @EnvironmentObject var authentication: Authentication
    @StateObject private var logInViewModel = LoginViewModel()
    @State var alertisPresented: Bool = false
    @State var isfocusAble: [Bool] = [true, false]
    @State var isRevealed: Bool  = false
    let screen = UIScreen.main.bounds.width
    var body: some View {
        VStack {
            LogInComponent()
        }
        VStack(alignment:.leading) {
            UserNameComponent()
            TextFieldView(keyboardType: .emailAddress,
                          returnVal: .next,
                          tag: 0,
                          text: $logInViewModel.credentials.email,
                          isfocusAble: $isfocusAble, isRevealed: $isRevealed)
                .frame(width: UIScreen.main.bounds.width / 2, height: 10)
                .ignoresSafeArea(.keyboard)
                .autocapitalization(.none)
            // .padding()
            Rectangle()
                .frame(width:UIScreen.main.bounds.width / 2 + 40,
                       height: 0.5)
            
            NavigationLink(destination: PhoneInfoView()) {
                PhoneNumberComponent()
            }
            PasswordComponent()
            VStack {
                VStack(alignment:.leading) {
                    HStack {
                        TextFieldView(keyboardType: .emailAddress,
                                      returnVal: .next,
                                      tag: 1,
                                      text: $logInViewModel.credentials.password,
                                      isfocusAble: $isfocusAble, isRevealed: $isRevealed)
                            .frame(width: UIScreen.main.bounds.width / 2,
                                   height: 10)
                        
                        ButtonActionIsReveled(onTap: {
                            isRevealed.toggle()
                        }, isRevealed: isRevealed)
                        
                    }
                }
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width / 2 + 40, height: 0.5)
            }
            VStack(alignment: .center) {
                ActionButtonView(alertisPresented: false)
            }
            if logInViewModel.showProgressView {
                ProgressView()
            }
            Button(action: {
                logInViewModel.login { success in
                    authentication.updateValidation(success: success)
                }
            }, label: {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 180, height: 40)
                    .overlay(
                        Text(LocalizedStringKey.init("logIn"))
                            .foregroundColor(.white)
                    )
            })
            .disabled(logInViewModel.loginDisabled)
            .padding(.bottom, 20)
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
            Spacer()
        }
        .autocapitalization(.none)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
        .disabled(logInViewModel.showProgressView)
        .alert(item: $logInViewModel.error) { error in
            Alert(title: Text("Invalid Login"), message: Text(error.localizedDescription))
        }
    }
}



