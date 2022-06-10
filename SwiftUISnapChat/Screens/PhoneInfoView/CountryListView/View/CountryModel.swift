//
//  Country.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 4/9/22.
//

import Foundation
import Combine

struct Countries: Codable {
    let countries: [Country]
    
    enum CodingKeys: String, CodingKey {
        case countries
    }
}
struct Country: Codable, Identifiable {
    let id = UUID()
    let code: String
    let dialCode: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case code
        case dialCode = "dial_code"
        case name
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decode(String.self, forKey: .code)
        dialCode = try values.decode(String.self, forKey: .dialCode)
        name = try values.decode(String.self, forKey: .name)
        
    }
    
    init(code: String, dialCode: String, name: String, url: String,id: String) {
        self.code = code
        self.dialCode = dialCode
        self.name = name
        
    }
}
