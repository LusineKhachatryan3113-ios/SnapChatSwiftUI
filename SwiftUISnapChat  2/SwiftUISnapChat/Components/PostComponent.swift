//
//  PostComponent.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 5/1/22.
//

import SwiftUI

struct PostComponent: View {
    var body: some View {
        Text(LocalizedStringKey.init("post"))
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

struct PostComponent_Previews: PreviewProvider {
    static var previews: some View {
        PostComponent()
    }
}
