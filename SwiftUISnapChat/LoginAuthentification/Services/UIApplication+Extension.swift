//
//  UIApplication+Extension.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 6/17/22.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

