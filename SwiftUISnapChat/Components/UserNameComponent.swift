//
//  userNameComponent.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 4/28/22.
//

import SwiftUI

struct UserNameComponent: View {
    var body: some View {
        Text(LocalizedStringKey.init("userName"))
            .modifier(ParameterModifier(width: 200,
                                        backgroundColor: .white,
                                        foregroundColor: .blue,
                                        height: 20,
                                        alignment: .leading,
                                        size: 10))
    }
}

struct userNameComponent_Previews: PreviewProvider {
    static var previews: some View {
        UserNameComponent()
    }
}
