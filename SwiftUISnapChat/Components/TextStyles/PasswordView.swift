//
//  PasswordView.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 4/21/22.
//

import SwiftUI


struct PasswordView: View {
    @State var text: String = ""
    @State private var isRevealed = false
    @State private var isFocused = false
    @State var isEnabled: Bool = true
    @State var isfocusAble: [Bool]
    var body: some View {
        HStack {
            TextFieldView(keyboardType: .numbersAndPunctuation, returnVal: .done, tag: 1, text: $text, isfocusAble: $isfocusAble)
            Button(action: {
                self.isRevealed.toggle()
            }) {
                Image(systemName: self.isRevealed ? "eye.slash.fill" : "eye.fill")
                    .foregroundColor(Color.gray)
            }
        }
        .foregroundColor(Color.white)
            .padding()
            .border(isFocused ? Color.white : Color.white)
            .background(isFocused ? Color.white : Color.white)
            .frame(height: 30)
    }
}
