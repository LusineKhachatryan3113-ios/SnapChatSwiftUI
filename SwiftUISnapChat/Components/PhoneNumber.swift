//
//  phoneNumber.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 4/28/22.
//

import SwiftUI

struct PhoneNumberComponent: View {
    var body: some View {
        Text(LocalizedStringKey.init("phoneNumber"))
            .modifier(ParameterModifier(width: 200,
                                        backgroundColor: .white,
                                        foregroundColor: .blue,
                                        height: 20,
                                        alignment: .leading,
                                        size: 8))
            .padding(.bottom, 10)
            .padding(.top, 10)
    }
}

struct phoneNumber_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberComponent()
    }
}
