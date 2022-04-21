//
//  CountryList.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 3/31/22.
//

import SwiftUI

struct CountryCodes : View {
    @State var phoneNumberView = PhoneNumberView(countryCode: "", countryFlag: "")
    @Environment(\.presentationMode) var presentation
    @Binding var countryCode : String
    @Binding var countryFlag : String
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading) {
                Text("Country or Region")
                    .font(.title)
                    .bold()
                  CountryFilter()
                   List(self.getCountries(), id: \.id) { country in
                       HStack {
                        Text("\(self.flag(country: country.code))")
                        Text(country.name)
                        Spacer()
                        Text(country.dialCode)
                       }
                       .background(Color.white)
                       .font(.system(size: 20))
                       .onTapGesture {
                        self.countryCode = country.dialCode
                        self.countryFlag = self.flag(country: country.code)
                        presentation.wrappedValue.dismiss()
                       }
                   }
                }
            .offset(x: 0, y: -30)
            
        }
    }
    
    func getCountries() -> [Country] {
        if let path = Bundle.main.path(forResource: "countryDictionary", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let countries:Countries = try! decoder.decode(Countries.self, from: data)
                return countries.countries
          } catch {
               print(error)
          }
        }
        return []
    }
    
    func flag(country:String) -> String {
            let base : UInt32 = 127397
            var flag = ""
            for v in country.unicodeScalars {
                flag.unicodeScalars.append(UnicodeScalar(base + v.value)!)
            }
            return flag
        }
    mutating func update(countryCode:String, countryFlag:String) {
        phoneNumberView.countryCode = countryCode
        phoneNumberView.countryFlag = countryFlag
    }
}
