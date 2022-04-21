//
//  PhoneInfoView.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 3/24/22.
//

import SwiftUI

struct PhoneInfoView: View {
    
    @StateObject private var formViewModel1 = FormViewModel1()
    @State var isEditing: Bool = false
    @State private var country = ""
    @State private var number = ""
    @State private var password = ""
    @State private var alertisPresented = false
    @State private var isRevealed = false
    @State var phoneNumber = ""
    @State var y : CGFloat = UIScreen.main.bounds.size.height
    @State var countryCode = ""
    @State var countryFlag = ""
    @State var phoneNumberView = PhoneNumberView(countryCode: "", countryFlag: "")
    @State var isfocusAble: [Bool] = [true, false]
    var width: CGFloat
    var body: some View {
      VStack {
            Text(LocalizedStringKey.init("logIn"))
               .font(.system(size:25))
               .background(Color.white)
               .foregroundColor(.black)
               .padding(.bottom, 30)
               .frame(alignment: .center)
           VStack(alignment:.leading,spacing: 10) {
                Text(LocalizedStringKey.init("numberPhone"))
                   .font(.system(size:10))
                   .background(Color.white)
                   .foregroundColor(.blue)
              HStack(alignment: .bottom) {
                    NavigationLink(destination: CountryCodes(countryCode: $countryCode,
                                                             countryFlag: $countryFlag)) {
                        phoneNumberView
                    }
                VStack(alignment: .leading) {
                        TextFieldView(keyboardType: .numbersAndPunctuation,
                                          returnVal: .next,
                                          tag: 0,
                                          text: $formViewModel1.name,
                                          isfocusAble: $isfocusAble)
                            .frame(width: 180, height: 10)
                            .ignoresSafeArea(.keyboard)
                            .autocapitalization(.none)
                        Rectangle()
                        .frame(width: 150, height: 0.5)
                        }
                    .offset(x: -90, y: 23)
                    }
                NavigationLink(destination: PostInfoView(width: 0.5)) {
                       Text(LocalizedStringKey.init("phoneNumber"))
                           .background(Color.white)
                           .foregroundColor(.blue)
                           .font(.system(size: 10))
                           .padding(.top, 30)
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
                    Rectangle()
                        .frame(width: 260, height: 0.5)
                    Text(formViewModel1.inlineErrorForPassword)
                        .foregroundColor(.red)
                        .font(.system(size:10))
                        .background(Color.white)
                        .foregroundColor(.blue)
                    }
                }
            .offset(x: 50)
            .padding(.bottom, 50)
            NavigationView {
                       Button(action: {
                           self.alertisPresented = true
                       }, label: {
                           Text(LocalizedStringKey.init("forgot"))
                               .font(.system(size:10))
                               .background(Color.white)
                               .foregroundColor(.blue)
                               .padding(.bottom, 200)
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
   }

   












   



