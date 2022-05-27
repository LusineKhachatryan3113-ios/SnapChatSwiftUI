//
//  RegisterView.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 3/24/22.
//
import SwiftUI

struct RegisterView: View {
    
    @StateObject  private var  registerViewModel = RegisterViewModel()
    let screen = UIScreen.main.bounds.width
    var body: some View {
        VStack {
            Text(LocalizedStringKey.init("register"))
                .modifier(ParameterModifier(width: 200,
                                            backgroundColor: .white,
                                            foregroundColor: .blue,
                                            height: 30,
                                            alignment: .center,
                                            size: 25))
                .padding(.bottom, 30)
        }
        VStack(alignment:.leading) {
            UserNameComponent()
            TextFieldView(keyboardType: .emailAddress,
                          returnVal: .next,
                          tag: 0,
                          text: $registerViewModel.email,
                          isfocusAble: $registerViewModel.isfocusAble)
                .frame(width: UIScreen.main.bounds.width / 2, height: 10)
                .ignoresSafeArea(.keyboard)
                .autocapitalization(.none)
            Rectangle().frame(width:UIScreen.main.bounds.width / 2 + 40,
                              height: 0.5)
            NavigationLink(destination: PhoneInfoView()) {
                PhoneNumberComponent()
            }
            PasswordComponent()
            
            VStack(alignment:.leading) {
                HStack {
                    VStack{
                        PasswordTextView(keyboardType: .numbersAndPunctuation,
                                         returnVal: .done,
                                         tag: 1,
                                         isRevealed: $registerViewModel.isRevealed,
                                         text: $registerViewModel.password,
                                         isfocusAble: $registerViewModel.isfocusAble)
                            .frame(width: UIScreen.main.bounds.width / 2,
                                   height: 20)
                    }
                    Button(action: {
                        registerViewModel.isRevealed.toggle()
                        
                    }) {
                        Image(systemName: self.registerViewModel.isRevealed ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(Color.gray)
                    }
                }
                Rectangle().frame(width: UIScreen.main.bounds.width / 2 + 40, height: 0.5)
                Text(registerViewModel.formViewModel.inlineErrorForPassword).foregroundColor(.red)
                    .font(.system(size:10))
                    .background(Color.white)
                    .foregroundColor(.blue)
            }
        }
        Button(action: {
            registerViewModel.alertisPresented = true
        }, label: {
            ForgotComponent()
        })
        .frame(width: UIScreen.main.bounds.width / 2 - 20, height: 30, alignment: .center)
        .alert(isPresented: $registerViewModel.alertisPresented, content: {
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
    .disabled(!registerViewModel.formViewModel.isValid)

}
}



