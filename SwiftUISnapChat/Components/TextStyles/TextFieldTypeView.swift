//
//  FirstResponder.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 3/28/22.
//

import SwiftUI

struct TextFieldView: UIViewRepresentable {
    let keyboardType: UIKeyboardType
    let returnVal: UIReturnKeyType
    let tag: Int
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
        var parent: TextFieldView
        init(_ textField: TextFieldView) {
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



