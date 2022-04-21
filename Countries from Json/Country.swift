//
//  Country.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 4/9/22.
//

import Foundation

struct Countries: Codable {
    let countries: [Country]
    
    enum CodingKeys: String, CodingKey {
        case countries
    }
}
struct Country: Codable, Identifiable, Hashable {
    var id: String
    let code:String
    let dialCode:String
    let name:String
    
    enum CodingKeys: String, CodingKey {
        case id
        case code
        case dialCode = "dial_code"
        case name
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decode(String.self, forKey: .code)
        dialCode = try values.decode(String.self, forKey: .dialCode)
        name = try values.decode(String.self, forKey: .name)
        id = code
    }
}
