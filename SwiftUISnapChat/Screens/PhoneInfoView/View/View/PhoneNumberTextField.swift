//
//  FirstResponderInt.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 3/30/22.
//
import SwiftUI

struct PhoneNumberView : View {
    @State var countryCode = ""
    @State var countryFlag = ""
    @State private var countryIndex = 0
    var countries = [Country]()
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
}
    


