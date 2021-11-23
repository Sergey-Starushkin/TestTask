//
//  LoginModel.swift
//  TestTask
//
//  Created by Sergey Starushkin on 13.11.21.
//

import ObjectMapper

struct LoginModel {
    var response = UserModel()
}

extension LoginModel: Mappable {
    
    init?(map: Map) {}
    
    // Mappable
    mutating func mapping(map: Map) {
        response <- map["response"]
    }
}

