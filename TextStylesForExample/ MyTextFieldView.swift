//
//  SearchingView.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 4/15/22.
//

import SwiftUI
struct MyTextFieldView: UIViewRepresentable {

    @Binding var text: String
    @Binding var isRevealed: Bool
    @Binding var isFocused: Bool
    @Binding var isEnabled: Bool

    func makeUIView(context: UIViewRepresentableContext<MyTextFieldView>) -> UITextField {
        let tf = UITextField(frame: .zero)
        tf.isUserInteractionEnabled = true
        tf.delegate = context.coordinator
        return tf
    }

    func makeCoordinator() -> MyTextFieldView.Coordinator {
        return Coordinator(text: $text, isEnabled: $isEnabled, isFocused: $isFocused)
    }


    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        uiView.isSecureTextEntry = !isRevealed
    }


    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        @Binding var isFocused: Bool

        init(text: Binding<String>, isEnabled: Binding<Bool>, isFocused: Binding<Bool>) {
            _text = text
            _isFocused = isFocused
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }

        func textFieldDidBeginEditing(_ textField: UITextField) {
            DispatchQueue.main.async {
               self.isFocused = true
            }
        }

        func textFieldDidEndEditing(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.isFocused = false
            }
        }

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return false
        }
    }
}
