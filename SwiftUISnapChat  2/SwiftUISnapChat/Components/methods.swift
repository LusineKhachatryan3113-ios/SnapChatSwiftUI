//
//  ModelLogIn.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 4/28/22.
//

import SwiftUI

class Methods:  ObservableObject {
    
    fileprivate func logInComponent() -> some View {
        return Text(LocalizedStringKey.init("logIn"))
            .modifier(ParameterModifier(width: 100,
                                        backgroundColor: .white,
                                        foregroundColor: .blue,
                                        height: 30,
                                        alignment: .center,
                                        size: 25))
            .padding(.bottom, 30)
    }
    
    
    fileprivate func userNameComponent() -> ModifiedContent<Text, ParameterModifier> {
        return Text(LocalizedStringKey.init("userName"))
            .modifier(ParameterModifier(width: 200,
                                        backgroundColor: .white,
                                        foregroundColor: .blue,
                                        height: 20,
                                        alignment: .leading,
                                        size: 10))
    }
    fileprivate func phoneNumber() -> some View {
        return Text(LocalizedStringKey.init("phoneNumber"))
            .modifier(ParameterModifier(width: 200,
                                        backgroundColor: .white,
                                        foregroundColor: .blue,
                                        height: 20,
                                        alignment: .leading,
                                        size: 8))
            .padding(.bottom, 10)
            .padding(.top, 10)
    }
    fileprivate func forgot() -> ModifiedContent<Text, ParameterModifier> {
        return Text(LocalizedStringKey.init("forgot"))
            .modifier(ParameterModifier(width: 200,
                                        backgroundColor: .white,
                                        foregroundColor: .blue,
                                        height: 20,
                                        alignment: .center,
                                        size: 8))
    }
    fileprivate func password() -> ModifiedContent<Text, ParameterModifier> {
        return Text(LocalizedStringKey.init("password"))
            .modifier(ParameterModifier(width: 200,
                                        backgroundColor: .white,
                                        foregroundColor: .blue,
                                        height: 20,
                                        alignment: .leading,
                                        size: 10))
    }
    fileprivate func PhoneComponent() -> ModifiedContent<Text, ParameterModifier> {
        return Text(LocalizedStringKey.init("phone"))
            .modifier(ParameterModifier(width: 200,
                                        backgroundColor: .white,
                                        foregroundColor: .blue,
                                        height: 20,
                                        alignment: .leading,
                                        size: 10))
    }
    fileprivate func PostComponent() -> some View {
        return Text(LocalizedStringKey.init("post"))
            .modifier(ParameterModifier(width: 200,
                                        backgroundColor: .white,
                                        foregroundColor: .blue,
                                        height: 20,
                                        alignment: .leading,
                                        size: 8))
            .padding(.bottom, 10)
            .padding(.top, 20)
    }
}
