//
//  logInComponent.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 4/28/22.
//

import SwiftUI

struct LogInComponent: View {
    var body: some View {
        Text(LocalizedStringKey.init("logIn"))
            .modifier(ParameterModifier(width: 100,
                                        backgroundColor: .white,
                                        foregroundColor: .blue,
                                        height: 30,
                                        alignment: .center,
                                        size: 25))
            .padding(.bottom, 30)
    }
}

struct logInComponent_Previews: PreviewProvider {
    static var previews: some View {
        LogInComponent()
    }
}
