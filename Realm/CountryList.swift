//
//  CountryList.swift
//  SwiftUISnapChat
//
//  Created by Lusine on 6/12/22.
//

import RealmSwift

class CountryList: Object, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var code: String
    @Persisted var dialCode: String
    @Persisted var name: String
    
    
}
