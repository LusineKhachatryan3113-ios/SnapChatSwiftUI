//
//  PostInfoView.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 3/24/22.
//

import SwiftUI

struct PostInfoView: View {
    
@StateObject private var postInfoViewModel = PostInfoViewModel()
    
    var body: some View {
        VStack {
            Text(LocalizedStringKey.init("logIn"))
                .modifier(ParameterModifier(width: 100,
                                            backgroundColor: .white,
                                            foregroundColor: .blue,
                                            height: 30,
                                            alignment: .center,
                                            size: 25))
                .padding(.bottom, 30)
            VStack(alignment: .leading)  {
                Text(LocalizedStringKey.init("userName"))
                    .background(Color.white)
                    .foregroundColor(.blue)
                    .font(.system(size: 10))
                TextFieldView(keyboardType: .default,
                              returnVal: .next,
                              tag: 0,
                              text: $postInfoViewModel.formViewModel.email,
                              isfocusAble: $postInfoViewModel.isfocusAble)
                    .frame(width: 170, height: 20)
                    .ignoresSafeArea(.keyboard)
                Rectangle().frame(width: 200, height: 0.5)
                NavigationLink(destination: PhoneInfoView()) {
                    Text(LocalizedStringKey.init("phoneNumber"))
                        .modifier(ParameterModifier(width: 200,
                                                    backgroundColor: .white,
                                                    foregroundColor: .blue,
                                                    height: 20,
                                                    alignment: .leading,
                                                    size: 10))
                }
                Text(LocalizedStringKey.init("password"))
                    .modifier(ParameterModifier(width: 200,
                                                backgroundColor: .white,
                                                foregroundColor: .blue,
                                                height: 20,
                                                alignment: .leading,
                                                size: 10))
                
                HStack {
                    VStack{
                        PasswordTextView(keyboardType: .numbersAndPunctuation,
                                         returnVal: .done,
                                         tag: 1, isRevealed: $postInfoViewModel.isRevealed,
                                         text: $postInfoViewModel.formViewModel.password,
                                         isfocusAble: $postInfoViewModel.isfocusAble)
                            .frame(width: 160, height: 20)
                    }
                    Button(action: {
                        postInfoViewModel.isRevealed.toggle()
                    }) {
                        Image(systemName: self.postInfoViewModel.isRevealed ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(Color.gray)
                    }
                }
                Rectangle().frame(width: 200, height: 0.5)
                Text(postInfoViewModel.formViewModel.inlineErrorForPassword).foregroundColor(.red)
                    .font(.system(size:10))
                    .background(Color.white)
                    .foregroundColor(.blue)
            }
        }
        VStack {
            Button(action: {
                postInfoViewModel.alertisPresented = true
            }, label: {
                Text(LocalizedStringKey.init("forgot"))
                    .modifier(ParameterModifier(width: 200,
                                                backgroundColor: .white,
                                                foregroundColor: .blue,
                                                height: 20,
                                                alignment: .center,
                                                size: 8))
                
            })
            
            
            .alert(isPresented: $postInfoViewModel.alertisPresented, content: {
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
            .disabled(!postInfoViewModel.formViewModel.isValid)
        }
        .padding()
    }
}
