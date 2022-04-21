//
//  Modifier.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 3/24/22.
//




import SwiftUI
 struct ParameterModifier: ViewModifier {
  @State var width: CGFloat
  @State var backgroundColor = Color.white
  @State var foregroundColor: Color

  func body(content: Content) -> some View {
      content
          .frame(width: width)
          .font(.body)
          .padding()
          .background(backgroundColor)
          .cornerRadius(30)
          .foregroundColor(foregroundColor)
  
  }
}

