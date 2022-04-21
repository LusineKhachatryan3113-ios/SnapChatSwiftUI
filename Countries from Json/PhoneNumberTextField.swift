//
//  FirstResponderInt.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 3/30/22.
//
import SwiftUI

struct PhoneNumberView : View {
 
//    @State var phoneNumber = ""
    @State var countryCode = ""
    @State var countryFlag = ""
   var text = Text("")
    
    var body: some View {
        GeometryReader { geometryProxy in
            ZStack {
                HStack (spacing: 10) {
                    VStack(spacing: 5) {
                    Text(countryCode.isEmpty ? "🇦🇺 +61" : "\(countryFlag) \(countryCode)")
                        .frame(width: 70, height: 40)
                        .foregroundColor(countryCode.isEmpty ? .secondary : .black)
                    Rectangle().frame(width: 70, height: 0.5)
                    }
                 }
              }
        }
    }
    
    mutating func update(countryCode:String, countryFlag:String) {
        self.text = Text(countryCode.isEmpty ? "🇦🇺 +61" : "\(countryFlag) \(countryCode)")

   }
}
