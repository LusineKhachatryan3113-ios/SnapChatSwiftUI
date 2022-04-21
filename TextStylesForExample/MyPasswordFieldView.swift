//
//  SwiftUIFile.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 4/16/22.
//

import SwiftUI

struct MyPasswordFieldView: View {
    
    @State var text: String = ""
    @State private var isRevealed = false
    @State private var isFocused = false
    @State var isEnabled: Bool = true
    var body: some View {
        HStack {
            MyTextFieldView(text: $text,
                        isRevealed: $isRevealed,
                        isFocused: $isFocused, isEnabled: $isEnabled)
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