//
//  LogInView.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 3/24/22.
//

import SwiftUI

struct LogInView: View {
    @StateObject  private var  logInViewModel = LogInViewModel()
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
                          text: $logInViewModel.formViewModel.email,
                          isfocusAble: $logInViewModel.isfocusAble)
                .frame(width: UIScreen.main.bounds.width / 2, height: 10)
                .ignoresSafeArea(.keyboard)
                .autocapitalization(.none)
            Rectangle().frame(width:UIScreen.main.bounds.width / 2 + 40,
                              height: 0.5)
            
            NavigationLink(destination: PhoneInfoView()) {
                PhoneNumberComponent()
            }
            Text(LocalizedStringKey.init("password"))
                .modifier(ParameterModifier(width: 200,
                                            backgroundColor: .white,
                                            foregroundColor: .blue,
                                            height: 20,
                                            alignment: .leading,
                                            size: 10))
            VStack {
                VStack (alignment:.leading) {
                    HStack {
                        PasswordTextView(keyboardType: .numbersAndPunctuation,
                                         returnVal: .done,
                                         tag: 1,
                                         isRevealed: $logInViewModel.isRevealed,
                                         text: $logInViewModel.formViewModel.password,
                                         isfocusAble: $logInViewModel.isfocusAble)
                            .frame(width: UIScreen.main.bounds.width / 2,
                                   height: 10)
                        Button(action: {
                            logInViewModel.isRevealed.toggle()
                            
                        }) {
                            Image(systemName: self.logInViewModel.isRevealed ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(Color.gray)
                        }
                    }
                    Rectangle().frame(width: UIScreen.main.bounds.width / 2 + 40, height: 0.5)
                    Text(logInViewModel.formViewModel.inlineErrorForPassword)
                        .foregroundColor(.red)
                        .font(.system(size:10))
                        .background(Color.white)
                }
                VStack {
                    Button(action: {
                        logInViewModel.alertisPresented = true
                    }, label: {
                        ForgotComponent()
                    })
                    .frame(width: UIScreen.main.bounds.width / 2 - 20, height: 30, alignment: .center)
                    .alert(isPresented: $logInViewModel.alertisPresented, content: {
                        Alert(title: Text(LocalizedStringKey.init("howpass?")),
                              primaryButton:
                                .default(Text(LocalizedStringKey.init("bymail"))),
                              secondaryButton:
                                .cancel(Text(LocalizedStringKey.init("byPhone"))))
                    })
                    Spacer()
                    
            NavigationLink(destination: AfterRegisterLogInView()) {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 180, height: 40)
                        .overlay(
                            Text(LocalizedStringKey.init("logIn"))
                                .foregroundColor(.white)
                            )
                    }
                .padding()
            .disabled(!logInViewModel.formViewModel.isValid)
        
        }
    }
          
        }
    }
}





