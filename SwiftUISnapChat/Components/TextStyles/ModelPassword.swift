//
//  Modelassword.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 4/21/22.
//

import SwiftUI

struct PasswordTextView: UIViewRepresentable {
    var keyboardType: UIKeyboardType
    var returnVal: UIReturnKeyType
    var tag: Int
    @Binding var isRevealed: Bool
    @Binding var text: String
    @Binding var isfocusAble: [Bool]
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.keyboardType = self.keyboardType
        textField.returnKeyType = self.returnVal
        textField.tag = self.tag
        textField.delegate = context.coordinator
        textField.autocorrectionType = .no
        return textField
        }
    func updateUIView(_ uiView: UITextField, context: Context) {
          if tag == 0 {
            uiView.isSecureTextEntry = !isRevealed
          } else if tag == 1 {
            uiView.isSecureTextEntry = !isRevealed
          }
        if isfocusAble[tag] {
            uiView.becomeFirstResponder()
            } else {
                uiView.resignFirstResponder()
                }
        }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
        }
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: PasswordTextView
        init(_ textField: PasswordTextView) {
            self.parent = textField
            }
        func updatefocus(textfield: UITextField) {
            textfield.becomeFirstResponder()
            }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if parent.tag == 0 {
                parent.isfocusAble = [false, true]
                parent.text = textField.text ?? ""
                } else if parent.tag == 1 {
                    parent.isfocusAble = [false, false]
                    parent.text = textField.text ?? ""
                    }
            return true
        }
      }
    }
