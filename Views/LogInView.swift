//
//  LogInView.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 3/24/22.
//

import SwiftUI

struct LogInView: View {
    @StateObject private var formViewModel1 = FormViewModel1()
    @State private var name = ""
    @State private var password = ""
    @State private var alertisPresented = false
    @State var text: String = ""
    @State var isfocusAble: [Bool] = [true, false]
    @State private var isRevealed = false
    @State private var isFocused = false
    @State var isEnabled: Bool = false
    var placeHolder: String
    var value: String
    var lineColor: Color
    var width: CGFloat
    var body: some View {
        VStack {
            Text(LocalizedStringKey.init("logIn"))
            .font(.system(size:25))
            .background(Color.white)
            .foregroundColor(.black)
            .padding(.bottom, 30)
            .frame(alignment: .center)
            VStack(alignment:.leading) {
                Text(LocalizedStringKey.init("userName"))
                .font(.system(size:10))
                .background(Color.white)
                .foregroundColor(.blue)
                TextFieldView(keyboardType: .default,
                                  returnVal: .next, tag: 0,
                                  text: $formViewModel1.name,
                                  isfocusAble: $isfocusAble)
                    .frame(width: 200, height: 10)
                    .ignoresSafeArea(.keyboard)
                    .autocapitalization(.none)
                Rectangle().frame(width: 230, height: 0.5)
                NavigationLink(destination: PhoneInfoView(width: 0.5)) {
                Text(LocalizedStringKey.init("phoneNumber"))
                    .background(Color.white)
                    .foregroundColor(.blue)
                    .font(.system(size: 10))
                    .padding(.bottom, 10)
                    .padding(.top, 10)
                }
                Text(LocalizedStringKey.init("password"))
                    .font(.system(size:10))
                    .background(Color.white)
                    .foregroundColor(.blue)
                VStack(alignment:.leading) {
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
                    Rectangle().frame(width: 230, height: 0.5)
                    Text(formViewModel1.inlineErrorForPassword).foregroundColor(.red)
                        .font(.system(size:10))
                        .background(Color.white)
                        .foregroundColor(.blue)
                    }
                }
            //.offset(x: 70)
            NavigationView {
                    Button(action: {
                        self.alertisPresented = true
                    }, label: {
                        Text(LocalizedStringKey.init("forgot"))
                            .font(.system(size:10))
                            .background(Color.white)
                            .foregroundColor(.blue)
                            .padding(.bottom, 190)
                            .padding(.top, 10)
                            .frame(alignment: .center)
            
                    })
                    .frame(width: 200, height: 30, alignment: .center)
                    .alert(isPresented: $alertisPresented, content: {
                        Alert(title: Text(LocalizedStringKey.init("howpass?")),
                              primaryButton:
                                .default(Text(LocalizedStringKey.init("bymail"))),
                              secondaryButton:
                                .cancel(Text(LocalizedStringKey.init("byPhone"))))
                        })
                }
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
      

