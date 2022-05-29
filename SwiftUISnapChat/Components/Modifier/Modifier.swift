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
  @State var height: CGFloat
 @State var alignment: Alignment
    @State var size: CGFloat
  func body(content: Content) -> some View {
      content
        .frame(width: width, height: height,alignment: alignment)
        .font(.system(size: size))
          .background(backgroundColor)
          .cornerRadius(30)
          .foregroundColor(foregroundColor)
  
  }
}


