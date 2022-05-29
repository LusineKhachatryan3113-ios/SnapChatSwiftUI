//
//  PhoneInfoView.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 3/24/22.
//

import SwiftUI

struct PhoneInfoView: View {
    
    @State var countries: [Country] = []
    @State var countryCode = ""
    @State var countryFlag = ""
    @StateObject private var phoneInfoViewModel = PhoneInfoViewModel()
    @State var phoneNumberView = PhoneNumberView(countryCode: "", countryFlag: "")
    var body: some View {
        VStack {
            LogInComponent()
            VStack(alignment:.leading,spacing: 10) {
                PhoneComponent()
                HStack(alignment: .bottom) {
                    NavigationLink(destination: GeneralList()) {
                        phoneNumberView
                    }
                    VStack(alignment: .leading) {
                        TextFieldView(keyboardType: .numbersAndPunctuation,
                                      returnVal: .next,
                                      tag: 0,
                                      text: $phoneInfoViewModel.formViewModel.email,
                                      isfocusAble: $phoneInfoViewModel.isfocusAble)
                            .frame(width: 180, height: 10)
                            .ignoresSafeArea(.keyboard)
                            .autocapitalization(.none)
                        Rectangle()
                            .frame(width: 150, height: 0.5)
                    }
                    .offset(x: -90, y: 23)
                }
                NavigationLink(destination: PostInfoView()) {
                    PostComponent()
                }
                
                PasswordComponent()
                VStack(alignment:.leading) {
                    HStack {
                        VStack{
                            PasswordTextView(keyboardType: .numbersAndPunctuation,
                                             returnVal: .done,
                                             tag: 1,
                                             isRevealed: $phoneInfoViewModel.isRevealed,
                                             text: $phoneInfoViewModel.formViewModel.password,
                                             isfocusAble: $phoneInfoViewModel.isfocusAble)
                                .frame(width: 220, height: 20)
                        }
                        Button(action: {
                            phoneInfoViewModel.isRevealed.toggle()
                        }) {
                            Image(systemName: phoneInfoViewModel.isRevealed ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(Color.gray)
                        }
                    }
                    Rectangle()
                        .frame(width: 260, height: 0.5)
                    Text(phoneInfoViewModel.formViewModel.inlineErrorForPassword)
                        .foregroundColor(.red)
                        .font(.system(size:10))
                        .background(Color.white)
                        .foregroundColor(.blue)
                }
            }
            .offset(x: 50)
            .padding(.bottom, 40)
            NavigationView {
                Button(action: {
                    phoneInfoViewModel.alertisPresented = true
                }, label: {
                    ForgotComponent()
                        .padding(.bottom, 200)
                        .padding(.top, 10)
                    
                })
                .frame(width: 200, height: 30, alignment: .center)
                .alert(isPresented: $phoneInfoViewModel.alertisPresented, content: {
                    Alert(title: Text(LocalizedStringKey.init("howpass?")),
                          primaryButton:
                            .default(Text(LocalizedStringKey.init("bymail"))),
                          secondaryButton:
                            .cancel(Text(LocalizedStringKey.init("byPhone"))))
                })
            }
        }
        NavigationLink(destination: AfterRegisterLogInView()) {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 180, height: 40)
                .overlay(
                    Text(LocalizedStringKey.init("logIn"))
                        .foregroundColor(.white)
                )
        } .padding().disabled(!phoneInfoViewModel.formViewModel.isValid)
        
    }
}

   












   

 


