//
//  forgot.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 4/28/22.
//

import SwiftUI

struct ForgotComponent: View {
    var body: some View {
        Text(LocalizedStringKey.init("forgot"))
            .modifier(ParameterModifier(width: 200,
                                        backgroundColor: .white,
                                        foregroundColor: .blue,
                                        height: 20,
                                        alignment: .center,
                                        size: 8))
    }
}

struct forgot_Previews: PreviewProvider {
    static var previews: some View {
        ForgotComponent()
    }
}
