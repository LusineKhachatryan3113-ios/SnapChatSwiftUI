//
//  PhoneComponent.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 5/1/22.
//

import SwiftUI

struct PhoneComponent: View {
    var body: some View {
        Text(LocalizedStringKey.init("phone"))
            .modifier(ParameterModifier(width: 200,
                                        backgroundColor: .white,
                                        foregroundColor: .blue,
                                        height: 20,
                                        alignment: .leading,
                                        size: 10))
    }
}

struct PhoneComponent_Previews: PreviewProvider {
    static var previews: some View {
        PhoneComponent()
    }
}
