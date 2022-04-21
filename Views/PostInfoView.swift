//
//  PostInfoView.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 3/24/22.
//

import SwiftUI

struct PostInfoView: View {
    @StateObject private var formViewModel1 = FormViewModel1()
    @State private var postName = ""
    @State private var password = ""
    @State private var alertisPresented = false
    @State private var isRevealed = false
    @State var text: String = ""
    @State var isfocusAble: [Bool] = [true, false]
    var width: CGFloat
    var body: some View {
        VStack {
            Text(LocalizedStringKey.init("logIn"))
                .font(.system(size:30))
                .background(Color.white)
                .foregroundColor(.black)
                .padding(.bottom, 10)
                .frame(alignment: .center)
            VStack(alignment: .leading)  {
                Text(LocalizedStringKey.init("post"))
                    .background(Color.white)
                    .foregroundColor(.blue)
                    .font(.system(size: 10))
                TextFieldView(keyboardType: .default,
                                  returnVal: .next,
                                  tag: 0,
                                  text: $formViewModel1.name,
                                  isfocusAble: $isfocusAble)
                    .frame(width: 170, height: 20)
                    .ignoresSafeArea(.keyboard)
                Rectangle().frame(width: 200, height: self.width)
                NavigationLink(destination: PhoneInfoView(width: 5)) {
                    Text(LocalizedStringKey.init("phoneNumber"))
                        .background(Color.white)
                        .foregroundColor(.blue)
                        .font(.system(size: 10))
                        .padding(.bottom, 10)
                    }
                Text(LocalizedStringKey.init("password"))
                    .background(Color.white)
                    .foregroundColor(.blue)
                    .font(.system(size:10))
                    .padding(.bottom, 10)
                HStack {
                    VStack{
                        PasswordTextView(keyboardType: .numbersAndPunctuation, returnVal: .done, tag: 1, isRevealed: $isRevealed, text: $formViewModel1.password, isfocusAble: $isfocusAble)
                        .frame(width: 200, height: 30)
                    }
                    Button(action: {
                        self.isRevealed.toggle()
                    }) {
                        Image(systemName: self.isRevealed ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(Color.gray)
                    }
                }
                Rectangle().frame(width: 200, height: self.width)
                Text(formViewModel1.inlineErrorForPassword).foregroundColor(.red)
                    .font(.system(size:10))
                    .background(Color.white)
                    .foregroundColor(.blue)
                }
            }
        VStack {
            Button(action: {
                self.alertisPresented = true
                }, label: {
                    Text(LocalizedStringKey.init("forgot"))
                        .font(.system(size:10))
                        .background(Color.white)
                        .foregroundColor(.blue)
                    })
            .frame(width: 200, height: 30, alignment: .center)
            .padding(.top, 20)
            .alert(isPresented: $alertisPresented, content: {
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
                } .padding().disabled(!formViewModel1.isValid)
           }
        .padding()
        }
     }
